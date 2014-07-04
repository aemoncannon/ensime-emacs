import pty
import shlex
import os
import time
import subprocess
from subprocess import Popen, PIPE, STDOUT

# Allocate new pseudo-terminal and spawn screen sessions
cmd = ["emacs", "-nw", "--basic-display", "--no-init-file", "--load", ".emacs_test.el"]
#cmd = ["vim"]
f = open("out", "w")
(master, slave) = pty.openpty()
p = subprocess.Popen(
  cmd,
  shell=False,
  stdin=slave,
  stdout=f,
  stderr=f)
# os.close(slave)
#os.close(master)

#out = os.fdopen(master)
#for line in out:
#  print line

#print len(lines)

#def master_read_callback(fd):
#  print "1 %s" % fd
#
#def stdin_read_callback(fd):
#  print "2 %s" % fd
#
#pty.spawn(shlex.split(cmdString), master_read_callback, stdin_read_callback)


# send commands to the screen session to interrupt xclock
# and quit gdb
#screenCmds = [
#    "stuff \\003",  # ctrl+c interrupts xclock, gives us gdb prompt
#    "stuff q\\012", # q\n tells gdb to quit.
#    "stuff y\\012", # answer "are you sure?" dialog
#    ]
#for cmd in screenCmds :
#    completeCmd = "screen -X -S xc eval \"%s\"" % cmd
#    args = shlex.split(completeCmd)
#    subprocess.call(args)
#    #time.sleep(1) # uncomment this to see the magic unfold
 
