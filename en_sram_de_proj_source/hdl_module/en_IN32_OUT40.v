`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/20 17:10:05
// Design Name: 
// Module Name: test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test(
    input  [31:0] INn, 
    output reg [39:0] OUT,
    input clk   
);

    always @(*) begin
       OUT[31:0] <= INn[31:0];
       OUT[32] <= INn[0] ^ INn[1] ^ INn[2] ^ INn[3] ^ INn[4] ^ INn[5] ^ INn[6] ^ INn[7] ^ INn[8] ^ INn[13] ^ INn[17] ^ INn[26] ^ INn[27] ^ INn[29];
       OUT[33] <= INn[0] ^ INn[1] ^ INn[2] ^ INn[3] ^ INn[4] ^ INn[12] ^ INn[16] ^ INn[18] ^ INn[21] ^ INn[22] ^ INn[23] ^ INn[24] ^ INn[25] ^ INn[28];
       OUT[34] <= INn[0] ^ INn[5] ^ INn[6] ^ INn[7] ^ INn[8] ^ INn[11] ^ INn[15] ^ INn[18] ^ INn[19] ^ INn[21] ^ INn[22] ^ INn[30] ^ INn[31];
       OUT[35] <= INn[1] ^ INn[5] ^ INn[10] ^ INn[14] ^ INn[18] ^ INn[19] ^ INn[20] ^ INn[23] ^ INn[24] ^ INn[26] ^ INn[27] ^ INn[28] ^ INn[29] ^ INn[30];
       OUT[36] <= INn[2] ^ INn[6] ^ INn[9] ^ INn[14] ^ INn[15] ^ INn[16] ^ INn[17] ^ INn[19] ^ INn[20] ^ INn[21] ^ INn[23] ^ INn[25] ^ INn[29] ^ INn[31];
       OUT[37] <= INn[3] ^ INn[7] ^ INn[9] ^ INn[10] ^ INn[11] ^ INn[12] ^ INn[13] ^ INn[20] ^ INn[22] ^ INn[24] ^ INn[25] ^ INn[27] ^ INn[31];
       OUT[38] <= INn[4] ^ INn[8] ^ INn[9] ^ INn[10] ^ INn[11] ^ INn[12] ^ INn[13] ^ INn[14] ^ INn[15] ^ INn[16] ^ INn[17] ^ INn[26] ^ INn[28] ^ INn[30];
       OUT[39] <= 0;
    end
endmodule