module mux2 (input wire i0, i1, j, output wire o);
  assign o = (j==0)?i0:i1;
endmodule

module mux4 (input wire [0:3] i, input wire [1:0]j, output wire o);
  wire  t0, t1;
  mux2 mux2_0 (i[0], i[1], j[0], t0);
  mux2 mux2_1 (i[2], i[3], j[0], t1);
  mux2 mux2_2 (t0, t1, j[1], o);
endmodule

module rl1(input wire [15:0]i,input wire [1:0]op,output wire [15:0]o);
  /*when op=00->left shift
  op-01->right shift
  op-10->left rotate
  op-11->right rotate*/
  mux4 m0({1'b0,i[1],i[15],i[1]},op,o[0]);
  mux4 m1({i[0],i[2],i[0],i[2]},op,o[1]);
  mux4 m2({i[1],i[3],i[1],i[3]},op,o[2]);
  mux4 m3({i[2],i[4],i[2],i[4]},op,o[3]);
  mux4 m4({i[3],i[5],i[3],i[5]},op,o[4]);
  mux4 m5({i[4],i[6],i[4],i[6]},op,o[5]);
  mux4 m6({i[5],i[7],i[5],i[7]},op,o[6]);
  mux4 m7({i[6],i[8],i[6],i[8]},op,o[7]);
  mux4 m8({i[7],i[9],i[7],i[9]},op,o[8]);
  mux4 m9({i[8],i[10],i[8],i[10]},op,o[9]);
  mux4 mA({i[9],i[11],i[9],i[11]},op,o[10]);
  mux4 mB({i[10],i[12],i[10],i[12]},op,o[11]);
  mux4 mC({i[11],i[13],i[11],i[13]},op,o[12]);
  mux4 mD({i[12],i[14],i[12],i[14]},op,o[13]);
  mux4 mE({i[13],i[15],i[13],i[15]},op,o[14]);
  mux4 mF({i[14],1'b0,i[14],i[0]},op,o[15]);
endmodule

module bitshift1(input wire [15:0]i,input wire s,input wire [1:0]op,output wire [15:0]o);
  wire [15:0]t;
  rl1 r(i,op,t);

  mux2 m10(i[0],t[0],s,o[0]);
  mux2 m11(i[1],t[1],s,o[1]);
  mux2 m12(i[2],t[2],s,o[2]);
  mux2 m13(i[3],t[3],s,o[3]);
  mux2 m14(i[4],t[4],s,o[4]);
  mux2 m15(i[5],t[5],s,o[5]);
  mux2 m16(i[6],t[6],s,o[6]);
  mux2 m17(i[7],t[7],s,o[7]);
  mux2 m18(i[8],t[8],s,o[8]);
  mux2 m19(i[9],t[9],s,o[9]);
  mux2 m1A(i[10],t[10],s,o[10]);
  mux2 m1B(i[11],t[11],s,o[11]);
  mux2 m1C(i[12],t[12],s,o[12]);
  mux2 m1D(i[13],t[13],s,o[13]);
  mux2 m1E(i[14],t[14],s,o[14]);
  mux2 m1F(i[15],t[15],s,o[15]);
endmodule

module rl2(input wire [15:0]i,input wire [1:0]op,output wire [15:0]o);
  /*when op=00->left shift
  op-01->right shift
  op-10->left rotate
  op-11->right rotate*/
  mux4 m0({1'b0,i[2],i[14],i[2]},op,o[0]);
  mux4 m1({1'b0,i[3],i[15],i[3]},op,o[1]);
  mux4 m2({i[0],i[4],i[0],i[4]},op,o[2]);
  mux4 m3({i[1],i[5],i[1],i[5]},op,o[3]);
  mux4 m4({i[2],i[6],i[2],i[6]},op,o[4]);
  mux4 m5({i[3],i[7],i[3],i[7]},op,o[5]);
  mux4 m6({i[4],i[8],i[4],i[8]},op,o[6]);
  mux4 m7({i[5],i[9],i[5],i[9]},op,o[7]);
  mux4 m8({i[6],i[10],i[6],i[10]},op,o[8]);
  mux4 m9({i[7],i[11],i[7],i[11]},op,o[9]);
  mux4 mA({i[8],i[12],i[8],i[12]},op,o[10]);
  mux4 mB({i[9],i[13],i[9],i[13]},op,o[11]);
  mux4 mC({i[10],i[14],i[10],i[14]},op,o[12]);
  mux4 mD({i[11],i[15],i[11],i[15]},op,o[13]);
  mux4 mE({i[12],1'b0,i[12],i[0]},op,o[14]);
  mux4 mF({i[13],1'b0,i[13],i[1]},op,o[15]);
endmodule

module bitshift2(input wire [15:0]i,input wire s,input wire [1:0]op,output wire [15:0]o);
  wire [15:0]t;
  rl2 r(i,op,t);

  mux2 m10(i[0],t[0],s,o[0]);
  mux2 m11(i[1],t[1],s,o[1]);
  mux2 m12(i[2],t[2],s,o[2]);
  mux2 m13(i[3],t[3],s,o[3]);
  mux2 m14(i[4],t[4],s,o[4]);
  mux2 m15(i[5],t[5],s,o[5]);
  mux2 m16(i[6],t[6],s,o[6]);
  mux2 m17(i[7],t[7],s,o[7]);
  mux2 m18(i[8],t[8],s,o[8]);
  mux2 m19(i[9],t[9],s,o[9]);
  mux2 m1A(i[10],t[10],s,o[10]);
  mux2 m1B(i[11],t[11],s,o[11]);
  mux2 m1C(i[12],t[12],s,o[12]);
  mux2 m1D(i[13],t[13],s,o[13]);
  mux2 m1E(i[14],t[14],s,o[14]);
  mux2 m1F(i[15],t[15],s,o[15]);
endmodule

module rl4(input wire [15:0]i,input wire [1:0]op,output wire [15:0]o);
  /*when op=00->left shift
  op-01->right shift
  op-10->left rotate
  op-11->right rotate*/
  mux4 m0({1'b0,i[4],i[12],i[4]},op,o[0]);
  mux4 m1({1'b0,i[5],i[13],i[5]},op,o[1]);
  mux4 m2({1'b0,i[6],i[14],i[6]},op,o[2]);
  mux4 m3({1'b0,i[7],i[15],i[7]},op,o[3]);
  mux4 m4({i[0],i[8],i[0],i[8]},op,o[4]);
  mux4 m5({i[1],i[9],i[1],i[9]},op,o[5]);
  mux4 m6({i[2],i[10],i[2],i[10]},op,o[6]);
  mux4 m7({i[3],i[11],i[3],i[11]},op,o[7]);
  mux4 m8({i[4],i[12],i[4],i[12]},op,o[8]);
  mux4 m9({i[5],i[13],i[5],i[13]},op,o[9]);
  mux4 mA({i[6],i[14],i[6],i[14]},op,o[10]);
  mux4 mB({i[7],i[15],i[7],i[15]},op,o[11]);
  mux4 mC({i[8],1'b0,i[8],i[0]},op,o[12]);
  mux4 mD({i[9],1'b0,i[9],i[1]},op,o[13]);
  mux4 mE({i[10],1'b0,i[10],i[2]},op,o[14]);
  mux4 mF({i[11],1'b0,i[11],i[3]},op,o[15]);
endmodule

module bitshift4(input wire [15:0]i,input wire s,input wire [1:0]op,output wire [15:0]o);
  wire [15:0]t;
  rl4 r(i,op,t);

  mux2 m10(i[0],t[0],s,o[0]);
  mux2 m11(i[1],t[1],s,o[1]);
  mux2 m12(i[2],t[2],s,o[2]);
  mux2 m13(i[3],t[3],s,o[3]);
  mux2 m14(i[4],t[4],s,o[4]);
  mux2 m15(i[5],t[5],s,o[5]);
  mux2 m16(i[6],t[6],s,o[6]);
  mux2 m17(i[7],t[7],s,o[7]);
  mux2 m18(i[8],t[8],s,o[8]);
  mux2 m19(i[9],t[9],s,o[9]);
  mux2 m1A(i[10],t[10],s,o[10]);
  mux2 m1B(i[11],t[11],s,o[11]);
  mux2 m1C(i[12],t[12],s,o[12]);
  mux2 m1D(i[13],t[13],s,o[13]);
  mux2 m1E(i[14],t[14],s,o[14]);
  mux2 m1F(i[15],t[15],s,o[15]);
endmodule

module rl8(input wire [15:0]i,input wire [1:0]op,output wire [15:0]o);
  /*when op=00->left shift
  op-01->right shift
  op-10->left rotate
  op-11->right rotate*/
  mux4 m0({1'b0,i[8],i[8],i[8]},op,o[0]);
  mux4 m1({1'b0,i[9],i[9],i[9]},op,o[1]);
  mux4 m2({1'b0,i[10],i[10],i[10]},op,o[2]);
  mux4 m3({1'b0,i[11],i[11],i[11]},op,o[3]);
  mux4 m4({1'b0,i[12],i[12],i[12]},op,o[4]);
  mux4 m5({1'b0,i[13],i[13],i[13]},op,o[5]);
  mux4 m6({1'b0,i[14],i[14],i[14]},op,o[6]);
  mux4 m7({1'b0,i[15],i[15],i[15]},op,o[7]);
  mux4 m8({i[0],1'b0,i[0],i[0]},op,o[8]);
  mux4 m9({i[1],1'b0,i[1],i[1]},op,o[9]);
  mux4 mA({i[2],1'b0,i[2],i[2]},op,o[10]);
  mux4 mB({i[3],1'b0,i[3],i[3]},op,o[11]);
  mux4 mC({i[4],1'b0,i[4],i[4]},op,o[12]);
  mux4 mD({i[5],1'b0,i[5],i[5]},op,o[13]);
  mux4 mE({i[6],1'b0,i[6],i[6]},op,o[14]);
  mux4 mF({i[7],1'b0,i[7],i[7]},op,o[15]);
endmodule

module bitshift8(input wire [15:0]i,input wire s,input wire [1:0]op,output wire [15:0]o);
  wire [15:0]t;
  rl8 r(i,op,t);

  mux2 m10(i[0],t[0],s,o[0]);
  mux2 m11(i[1],t[1],s,o[1]);
  mux2 m12(i[2],t[2],s,o[2]);
  mux2 m13(i[3],t[3],s,o[3]);
  mux2 m14(i[4],t[4],s,o[4]);
  mux2 m15(i[5],t[5],s,o[5]);
  mux2 m16(i[6],t[6],s,o[6]);
  mux2 m17(i[7],t[7],s,o[7]);
  mux2 m18(i[8],t[8],s,o[8]);
  mux2 m19(i[9],t[9],s,o[9]);
  mux2 m1A(i[10],t[10],s,o[10]);
  mux2 m1B(i[11],t[11],s,o[11]);
  mux2 m1C(i[12],t[12],s,o[12]);
  mux2 m1D(i[13],t[13],s,o[13]);
  mux2 m1E(i[14],t[14],s,o[14]);
  mux2 m1F(i[15],t[15],s,o[15]);
endmodule

module barrelshifter16(input wire [15:0]i,input wire [3:0]s,input wire [1:0]op,output wire [15:0]o);
  wire [15:0]t1,t2,t3;

  bitshift8 b8(i,s[3],op,t1);
  bitshift4 b4(t1,s[2],op,t2);
  bitshift2 b2(t2,s[1],op,t3);
  bitshift1 b1(t3,s[0],op,o);
endmodule