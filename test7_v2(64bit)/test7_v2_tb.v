///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: test7_v2_tb.v
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

module test7_v2_tb;

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


//input
reg [63:0] INn;
reg W_EN;
reg R_EN;
reg [13:0] R_ADDR, W_ADDR;
reg [63:0] selectt;

//Output
wire [63:0] real_data;
wire [63:0] wrong_real_data;
reg [13:0] R_ADDRr;

reg SGLl , DBLl;

//////////////////////////////////////////////////////////////////////
// Instantiate Unit Under Test:  test7_v2
//////////////////////////////////////////////////////////////////////
test7_v2 test7_v2_0 (
    // Inputs
    .INn(INn),
    .clk(SYSCLK),
    .selectt(selectt),
    .R_EN(R_EN),
    .R_ADDR(R_ADDR),
    .W_EN(W_EN),
    .W_ADDR(W_ADDR),

    // Outputs
    .R_ADDRr(R_ADDRr),
    .real_data(real_data),
    .wrong_real_data(wrong_real_data),
    
    .SGLl(SGLl),
    .DBLl(DBLl)
    

);

initial begin
#50
W_EN = 1;
R_EN = 1;

W_ADDR = 1;
//R_ADDR = 1;
selectt = 0;
INn  = 64'd10;
#200
W_ADDR = 2;
selectt = 2;
INn  = 64'd20;
//
#200
W_ADDR = 3;
selectt = 3;
INn  = 64'd30;
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
selectt = 66;
INn  = 63'd40;
#200
W_ADDR =6;
R_ADDR =5;

end
endmodule

