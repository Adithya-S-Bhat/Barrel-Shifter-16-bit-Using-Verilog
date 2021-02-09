# Barrel-Shifter
Port Specification:

i[15:0]-->16-bit input  
op[1:0]-->2-bit opcode  
s[3:0]-->4-bit select line  
  If s[3] is high-input shifts by 8 bits.  
  If s[2] is high-input shifts by 4 bits.  
  If s[1] is high-input shifts by 2 bits.  
  If s[0] is high-input shifts by 1 bit.  
o[15:0]-->16-bit output  


Operations:  
opcode	Operation  
00      Left Shift  
01      Right Shift  
10      Left Rotate  
11      Right Rotate  
