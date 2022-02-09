///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: test2_tb.v
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

module test2_tb;

parameter SYSCLK_PERIOD = 50;// 10MHZ

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
// Instantiate Unit Under Test:  test2
//////////////////////////////////////////////////////////////////////

reg [79:0] W_DATA;
reg [7:0] WBYTE_EN;
reg R_EN, W_EN;
reg [13:0] R_ADDR, W_ADDR;
reg [63:0] selectt;

wire [79:0] R_DATA;
wire [63:0] data_64_out;
wire [13:0] error_address;
wire [63:0] error_data;
wire ERRr;
wire error_flag;
//wire [63:0] real_data;

test2 test2_0 (
    // Inputs
    .R_EN(R_EN),
    .W_EN(W_EN),
    .CLK(SYSCLK),
    .R_ADDR(R_ADDR),
    .W_ADDR(W_ADDR),
    .W_DATA(W_DATA),
    .WBYTE_EN(WBYTE_EN),
    .selectt(selectt),

    // Outputs
    .error_flag(error_flag),
    .ERRr(ERRr),
    .R_DATA(R_DATA),
    .error_address(error_address),
    .error_data(error_data),
    //.real_data(real_data),
    .data_64_out(data_64_out)
);


initial begin
#25
W_EN = 1;
R_EN = 0;
//WBYTE_EN = 8'b0000_0000;
WBYTE_EN = 8'b1111_1111;
W_ADDR = 14'd1;
//W_DATA = 80'd11111111111111111111111111111111111111111111111111111111111111111111111111111111;//80'd11;;
W_DATA =80'd11;

#100
//WBYTE_EN = 8'b0000_0001;
W_ADDR = 14'd2;
//W_DATA = 80'd11111111111111111111111111111111111111111111111111111111111111111111111111111111;//80'd12;
W_DATA = 80'd12;

#100
//WBYTE_EN = 8'b0000_0010;
W_ADDR = 14'd3;
//W_DATA = 80'd11111111111111111111111111111111111111111111111111111111111111111111111111111111;//80'd13;
W_DATA = 80'd13;

#100
//WBYTE_EN = 8'b0000_0100;
W_ADDR = 14'd4;
//W_DATA = 80'd11111111111111111111111111111111111111111111111111111111111111111111111111111111;//80'd14;
W_DATA = 80'd14;

#100
//WBYTE_EN = 8'b0000_1000;
W_ADDR = 14'd5;
//W_DATA = 80'd11111111111111111111111111111111111111111111111111111111111111111111111111111111;//80'd15;
W_DATA = 80'd15;

#100
//WBYTE_EN = 8'b0001_0000;
W_ADDR = 14'd6;
//W_DATA = 80'd11111111111111111111111111111111111111111111111111111111111111111111111111111111;//80'd16;
W_DATA = 80'd16;

#100
//WBYTE_EN = 8'b0010_0100;
W_ADDR = 14'd7;
//W_DATA = 80'd11111111111111111111111111111111111111111111111111111111111111111111111111111111;//80'd17;
W_DATA = 80'd17;

#100
//WBYTE_EN = 8'b0100_0000;
W_ADDR = 14'd8;
//W_DATA = 80'd11111111111111111111111111111111111111111111111111111111111111111111111111111111;//80'd18;
W_DATA = 80'd18;

#100
//WBYTE_EN = 8'b1111_1111;
W_ADDR = 14'd9;
//W_DATA = 80'd11111111111111111111111111111111111111111111111111111111111111111111111111111111;//80'd19;
W_DATA = 80'd19;

#100
//WBYTE_EN = 8'b0000_1000;
W_ADDR = 14'd10;
W_DATA = 80'd77;

#100
//WBYTE_EN = 8'b1111_1111;
W_ADDR = 14'd11;

W_DATA = { 1'b0 , 1'b0 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 ,1'b1 , 1'b1 , 1'b0 , 1'b0 , 1'b1 , 1'b1 , 1'b1 , 1'b1, 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b0 , 1'b0 ,
 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b0 , 1'b0 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b0 , 1'b0 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 
 1'b1, 1'b0 , 1'b0 , 1'b1 , 1'b1 , 1'b1 ,1'b1 , 1'b1 , 1'b1 , 1'b1 ,1'b1 , 1'b0 , 1'b0 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1, 1'b0 , 1'b0 ,1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 };

 #100
W_ADDR = 14'd33;
W_DATA = 80'd33;

#100
R_EN = 1;
#100

R_ADDR = 14'd1;
#100
R_ADDR = 14'd2;
selectt = 64'd0;
#50
R_ADDR = 14'd3;
selectt = 64'd1;
#50
R_ADDR = 14'd4;
selectt = 64'd2;
#50
R_ADDR = 14'd5;
selectt = 64'd100;
#50
R_ADDR = 14'd6;
selectt = 64'd3;
#50
R_ADDR = 14'd7;
selectt = 64'd100;
#50
R_ADDR = 14'd8;
selectt = 64'd100;
#50
R_ADDR = 14'd9;
selectt = 64'd0;
#50;
R_ADDR = 14'd10;
selectt = 64'd63;
#50
R_ADDR = 14'd11;
selectt = 64'd40;
#50
R_ADDR = 14'd33;
selectt = 64'd0;
#50
selectt = 64'd100;

end
/*
initial begin
$monitor("time :%t ,data_64_out(correct) = %b   , error_address = %d , error_data = %b ",$time, data_64_out,error_address,error_data );

end
initial begin
$monitor("time :%t ,W_DATA = %b, R_EN = %b, W_EN = %b, W_ADDR = %d, selectt = %d",$time, W_DATA, R_EN, W_EN, W_ADDR, selectt);

end
*/


endmodule

