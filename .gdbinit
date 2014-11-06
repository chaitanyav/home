# References
#-----------------------------------------------------------------------------
#http://www.ibm.com/developerworks/aix/library/au-gdb.html
#http://www.cs.berkeley.edu/~mavam/teaching/cs161-sp11/gdb-refcard.pdf
#
#
#-----------------------------------------------------------------------------


define bps
  info breakpoints
end

document bps
  list all breakpoints
end

define bpd
  disable $arg0
end

document bpd
 disable a breakpoint
 usage: bpd num
end

define bpe
  enable $arg0
end

document bpe
 enable a breakpoint
 usage: bpe num
end

define bpc
  clear $arg0
end

document bpc
 clear breakpoint at function/address
 usage: bpc addr
end

define bpdel
  delete $arg0
end

document bpdel
  delete breakpoint at num
  usage: bpdel num
end

define args
  show args
end

document args
  see help for 'show args'
end

define cls
  shell clear
end

document cls
  Clears the screen
end

define var
  info variables
end

document var
 Print variables (symbols) in target
end

define func
 info functions
end

document func
 Print functions in target
end

define dis
 disassemble $arg0
end

document dis
 dissassemble address/function
 usage: dis addr
end

define lib
 info sharedlibrary
end

document lib
 Print shared libraries linked to target
end

define sig
  info signals
end

document sig
 Print signal actions for target
end

define thread
 info threads
end

document thread
 Print threads in target
end

set history filename ~/.gbninit
set history save on
set history size 10000
set listsize 10
shell date
