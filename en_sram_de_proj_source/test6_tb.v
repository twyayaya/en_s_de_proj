///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: test6_tb.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::PolarFire> <Die::MPF300TS> <Package::FCG1152>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

`timescale 1ns/100ps

module test6_tb;

parameter SYSCLK_PERIOD = 100;// 10MHZ

reg SYSCLK;
reg NSYSRESET;

initial
begin
    SYSCLK = 1'b0;
    NSYSRESET = 1'b0;
end

//////////////////////////////////////////////////////////////////////
// Reset Pulse
//////////////////////////////////////////////////////////////////////
initial
begin
    #(SYSCLK_PERIOD * 10 )
        NSYSRESET = 1'b1;
end


//////////////////////////////////////////////////////////////////////
// Clock Driver
//////////////////////////////////////////////////////////////////////
always @(SYSCLK)
    #(SYSCLK_PERIOD / 2.0) SYSCLK <= !SYSCLK;


//////////////////////////////////////////////////////////////////////
// Instantiate Unit Under Test:  test6
//////////////////////////////////////////////////////////////////////


//IN port
reg [31:0] INn;
reg W_EN;
reg R_EN;
reg [9:0] R_ADDR, W_ADDR;
reg [31:0] selectt;

//OUT port
//wire ERR, SGL, DBL;
//wire [39:0] OUTt;

//wire [6:0] SYN;

//wire [5:0] testt;
wire [31:0] real_data;
//wire [7:0] parity_data;
wire [31:0] wrong_real_data;
reg[9:0] R_ADDRr;

test6 test6_0 (
    // Inputs
    .clk(SYSCLK),
    .W_EN(W_EN),
    .R_EN(R_EN),
    .R_ADDR(R_ADDR),
    .W_ADDR(W_ADDR),
    .INn(INn),
    .selectt(selectt),

    // Outputs
    //.ERR(ERR),
    //.SGL(SGL),
    //.DBL(DBL),
    .wrong_real_data(wrong_real_data),
    //.OUTt(OUTt),
    
    //.SYN(SYN),
    
    .real_data(real_data),
    //.parity_data(parity_data),
    //.testt(testt)
    //new
    .R_ADDRr(R_ADDRr)
);

initial begin
#50
W_EN = 1;
R_EN = 1;

W_ADDR = 1;
//R_ADDR = 1;
selectt = 0;
INn  = 31'd10;
#200
W_ADDR = 2;
selectt = 2;
INn  = 31'd20;
//
#200
W_ADDR = 3;
selectt = 3;
INn  = 31'd30;
#200
R_ADDR = 1;
//
W_ADDR = 4;
//
#200
R_ADDR = 2;
//
#200
R_ADDR = 3;
#200
W_EN = 0;
#200
R_EN = 0;
#200
R_EN = 1;
W_EN = 1;
#200
W_ADDR = 5;
selectt = 32;
INn  = 31'd40;
#200
W_ADDR =6;
R_ADDR =5;

end

endmodule
