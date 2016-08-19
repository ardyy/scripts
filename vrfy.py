#!/usr/bin/python
import socket
import sys

print '-----------------'
print 'Created by G3JR0K'
print '-----------------'

if len(sys.argv) != 3:
	print "Usage = vrfy.py <userlist_file> <target_ip>"
	sys.exit(0)

# Open username file
usernames_file = open(sys.argv[1])

# Create a Socket
s=socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect to the Server
connect=s.connect((sys.argv[2],25))

# Receive the banner
banner=s.recv(1024)
print banner

# Open for each file
for line in usernames_file:
	username = line.strip()
	s.send('VRFY ' + username  + '\r\n')
	result=s.recv(1024)
	print result

# Close the socket
s.close()
