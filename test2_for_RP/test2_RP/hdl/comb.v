///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: comb.v
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

//`timescale <time_units> / <precision>

module comb( checkbits, sramdata, DatatoDecoder );
input [7:0] checkbits;
input [63:0] sramdata;
output [71:0] DatatoDecoder;


reg [71:0] DatatoDecoder_0 ;
assign DatatoDecoder = DatatoDecoder_0;

always@(sramdata)begin

DatatoDecoder_0 = {checkbits,sramdata};

end
endmodule

