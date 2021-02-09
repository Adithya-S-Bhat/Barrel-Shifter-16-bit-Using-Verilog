`timescale 1 ns / 100 ps
`define TESTVECS 16

module tb;
  reg clk, reset;
  reg [15:0] i0; reg [3:0] s; reg [1:0] op; 
  wire [15:0] o;
  reg [22:0] test_vecs [0:(`TESTVECS-1)];
  integer i;
  initial begin $dumpfile("tb_barrelshifter.vcd"); $dumpvars(0,tb); end
  initial begin reset = 1'b1; #12.5 reset = 1'b0; end
  initial clk = 1'b0; always #5 clk =~ clk;
  initial begin
    test_vecs[0][22:6] = 16'h0000; test_vecs[0][6:2] = 4'b0000;test_vecs[0][1:0] = 2'b00;
    test_vecs[1][22:6] = 16'haa55; test_vecs[1][6:2] = 4'b0001;test_vecs[1][1:0] = 2'b00;
    test_vecs[2][22:6] = 16'hffff; test_vecs[2][6:2] = 4'b0010;test_vecs[2][1:0] = 2'b00;
    test_vecs[3][22:6] = 16'h0001; test_vecs[3][6:2] = 4'b0011;test_vecs[3][1:0] = 2'b00;
    test_vecs[4][22:6] = 16'h0000; test_vecs[4][6:2] = 4'b0100;test_vecs[4][1:0] = 2'b01;
    test_vecs[5][22:6] = 16'haa55; test_vecs[5][6:2] = 4'b0101;test_vecs[5][1:0] = 2'b01;
    test_vecs[6][22:6] = 16'hffff; test_vecs[6][6:2] = 4'b0110;test_vecs[6][1:0] = 2'b01;
    test_vecs[7][22:6] = 16'h0001; test_vecs[7][6:2] = 4'b0111;test_vecs[7][1:0] = 2'b01;
    test_vecs[8][22:6] = 16'h0000; test_vecs[8][6:2] = 4'b1000;test_vecs[8][1:0] = 2'b10;
    test_vecs[9][22:6] = 16'haa55; test_vecs[9][6:2] = 4'b1001;test_vecs[9][1:0] = 2'b10;
    test_vecs[10][22:6] = 16'hffff; test_vecs[10][6:2] = 4'b1010;test_vecs[10][1:0] = 2'b10;
    test_vecs[11][22:6] = 16'h0001; test_vecs[11][6:2] = 4'b1011;test_vecs[11][1:0] = 2'b10;
    test_vecs[12][22:6] = 16'h0000; test_vecs[12][6:2] = 4'b1100;test_vecs[12][1:0] = 2'b11;
    test_vecs[13][22:6] = 16'haa55; test_vecs[13][6:2] = 4'b1101;test_vecs[13][1:0] = 2'b11;
    test_vecs[14][22:6] = 16'hffff; test_vecs[14][6:2] = 4'b1110;test_vecs[14][1:0] = 2'b11;
    test_vecs[15][22:6] = 16'h0001; test_vecs[15][6:2] = 4'b1111;test_vecs[15][1:0] = 2'b11;
  end
  initial {op, i0, s} = 0;
  barrelshifter16 b16(i0, s, op, o);
  initial begin
    #6 for(i=0;i<`TESTVECS;i=i+1)
      begin #10 {i0, s, op}=test_vecs[i]; end
    #100 $finish;
  end
endmodule
