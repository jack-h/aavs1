import corr
import sys
import time
import numpy as np
from optparse import OptionParser

def set_incrementor(roach, name, inc_by, inc_every, base_cnt=2**14):
    roach.write_int(name+'_inc_by', inc_by * base_cnt/inc_every)

def set_item(roach, name, id_num, val=None):
    roach.write_int(name+'_id', id_num)
    if val is not None:
        roach.write_int(name+'_val', val)

def set_packet_rate(roach, period, payload):
    roach.write_int('pkt_sim_period', period) # in 156 MHz clocks
    roach.write_int('pkt_sim_payload_len', payload) # in 64 bit words
    print 'Packet rate: %d PPS'%(156e6/period)
    print 'Data rate: %.4f Gb/s'%(156e6/period * payload * 64 / 1e9)

def ip_str2int(ip_str):
    dest_ip_int = 0
    for xn, x in enumerate(map(int, ip_str.split('.'))):
        dest_ip_int += (x<<((3-xn)*8))
    return dest_ip_int

BOFFILE = 'channelised_spead_sim_2015_Aug_31_1729.bof'
p = OptionParser()
p.set_usage('script.py <ROACH_HOSTNAME_or_IP> [options]')
p.set_description(__doc__)
p.add_option('-p', '--noprogram', dest='noprogram', action='store_true',
    help='Don\'t program the FPGA.')  
p.add_option('-b', '--boffile', dest='boffile', type='str', default=BOFFILE,
    help='Specify the bof file to load')  
p.add_option('-c', '--chans', dest='n_chans', type='int', default=1024,
    help='Number of channels. Default:1024')  
p.add_option('-a', '--ants', dest='n_ants', type='int', default=16,
    help='Number of antennas. Default:16')  
p.add_option('-i', '--dest_ip', dest='dest_ip', type='str', default='10.0.0.10',
    help='Destination IP. Default: 10.0.0.10')  
p.add_option('-P', '--port', dest='dest_port', type='int', default=10000,
    help='Destination port. Default: 10000')  
p.add_option('-l', '--payload_len', dest='payload_len', type='int', default=64,
    help='Payload length in 64 bit words. Default: 64')  
p.add_option('-t', '--period', dest='period', type='int', default=1000000,
    help='Period of packet transmission in 156MHz clock cycles. Default: 1000000')  
opts, args = p.parse_args(sys.argv[1:])

if args==[]:
    print 'Please specify a ROACH board. \nExiting.'
    exit()
else:
    print 'Connecting to roach', args[0]
    roach = corr.katcp_wrapper.FpgaClient(args[0])
time.sleep(0.1)

if not opts.noprogram:
    print 'Programming with', opts.boffile
    roach.progdev(opts.boffile)
time.sleep(0.1)

# Configure header properties
print 'Configuring headers'

#spead header
roach.write_int('spead_hdr_magic', 83)
roach.write_int('spead_hdr_version', 4)
roach.write_int('spead_hdr_item_ptr_width', 3)
roach.write_int('spead_hdr_heap_addr_width', 5)
roach.write_int('spead_hdr_reserved', 0)
roach.write_int('spead_hdr_n_items', 6)

set_item(roach, 'payload_len', 0x10, opts.payload_len*8)
# ref time has a start value which is then incremented
set_item(roach, 'ref_time', 0x11, int(time.time()))
set_incrementor(roach, 'ref_time', 0, 1) #don't increment

set_item(roach, 'stat_tile', 0x12)
roach.write_int('stat_tile_station', 0)
roach.write_int('stat_tile_tile', 0)
set_item(roach, 'time_stamp', 0x13)
set_incrementor(roach, 'time_stamp', 1, 2**14)
set_item(roach, 'payload_pointer', 0x14)
set_incrementor(roach, 'payload_pointer', 0, 1)
set_item(roach, 'ant_chan_id', 0x15)
set_incrementor(roach, 'ant_chan_id_chan', 1, opts.n_ants)
set_incrementor(roach, 'ant_chan_id_ant', 1, 1)
roach.write_int('ant_chan_id_n_chans', opts.n_chans)
roach.write_int('ant_chan_id_n_ants', opts.n_ants)

# configure test vector data
# packets count every 16bit sample, starting at the value set in the tvg bram
print 'Loading TVG data'
#tvg = np.arange(2**16, dtype='>h')
tvg = np.zeros(2**16, dtype='>h') #counters for all packets start at 0
roach.write('payload_bram', tvg.tostring())

# configure tge core
print 'Configuring 10gbe core'
roach.write_int('dest_ip', ip_str2int(opts.dest_ip))
roach.write_int('port', opts.dest_port)
roach.config_10gbe_core('ten_Gbe_v2', 0x001122334455, ip_str2int('10.0.0.100'), opts.dest_port, [0xffffffffffff]*256) #broadcast all packets

# configure packet generation rate
print 'Configuring packet timer'
set_packet_rate(roach, opts.period, (opts.payload_len) + 8)

# reset everything
print 'resetting'
roach.write_int('pkt_sim_enable', 0)
roach.write_int('rst', 3)
roach.write_int('rst', 0)
roach.write_int('pkt_sim_enable', 1)

while(True):
    print 'Packets sent: %d'%roach.read_int('eof_cnt')
    time.sleep(1)
