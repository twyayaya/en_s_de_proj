`timescale 1ns / 1ps

module en64_RP2 (
    input [63:0] INn, 
    output reg [7:0] OUTt,
    input clk   
);

    always @(*) begin
       OUTt[0] <= INn[0] ^ INn[1] ^ INn[2] ^ INn[3] ^ INn[4] ^ INn[5] ^ INn[6] ^ INn[7] ^ INn[10] ^ INn[13] ^ INn[14] ^ INn[17] ^ INn[20] ^ INn[23] ^ INn[24] ^ INn[27] ^ INn[35] ^ INn[43] ^ INn[46] ^ INn[47] ^ INn[51] ^ INn[52] ^ INn[53] ^ INn[56] ^ INn[57] ^ INn[58];
       OUTt[1] <= INn[0] ^ INn[1] ^ INn[2] ^ INn[8] ^ INn[9] ^ INn[10] ^ INn[11] ^ INn[12] ^ INn[13] ^ INn[14] ^ INn[15] ^ INn[18] ^ INn[21] ^ INn[22] ^ INn[25] ^ INn[28] ^ INn[31] ^ INn[32] ^ INn[35] ^ INn[43] ^ INn[51] ^ INn[54] ^ INn[55] ^ INn[59] ^ INn[60] ^ INn[61];
       OUTt[2] <= INn[3] ^ INn[4] ^ INn[5] ^ INn[8] ^ INn[9] ^ INn[10] ^ INn[16] ^ INn[17] ^ INn[18] ^ INn[19] ^ INn[20] ^ INn[21] ^ INn[22] ^ INn[23] ^ INn[26] ^ INn[29] ^ INn[30] ^ INn[33] ^ INn[36] ^ INn[39] ^ INn[40] ^ INn[43] ^ INn[51] ^ INn[59] ^ INn[62] ^ INn[63];
       OUTt[3] <= INn[3] ^ INn[6] ^ INn[7] ^ INn[11] ^ INn[12] ^ INn[13] ^ INn[16] ^ INn[17] ^ INn[18] ^ INn[24] ^ INn[25] ^ INn[26] ^ INn[27] ^ INn[28] ^ INn[29] ^ INn[30] ^ INn[31] ^ INn[34] ^ INn[37] ^ INn[38] ^ INn[41] ^ INn[44] ^ INn[47] ^ INn[48] ^ INn[51] ^ INn[59];
       OUTt[4] <= INn[3] ^ INn[11] ^ INn[14] ^ INn[15] ^ INn[19] ^ INn[20] ^ INn[21] ^ INn[24] ^ INn[25] ^ INn[26] ^ INn[32] ^ INn[33] ^ INn[34] ^ INn[35] ^ INn[36] ^ INn[37] ^ INn[38] ^ INn[39] ^ INn[42] ^ INn[45] ^ INn[46] ^ INn[49] ^ INn[52] ^ INn[55] ^ INn[56] ^ INn[59];
       OUTt[5] <= INn[0] ^ INn[3] ^ INn[11] ^ INn[19] ^ INn[22] ^ INn[23] ^ INn[27] ^ INn[28] ^ INn[29] ^ INn[32] ^ INn[33] ^ INn[34] ^ INn[40] ^ INn[41] ^ INn[42] ^ INn[43] ^ INn[44] ^ INn[45] ^ INn[46] ^ INn[47] ^ INn[50] ^ INn[53] ^ INn[54] ^ INn[57] ^ INn[60] ^ INn[63];
       OUTt[6] <= INn[1] ^ INn[4] ^ INn[7] ^ INn[8] ^ INn[11] ^ INn[19] ^ INn[27] ^ INn[30] ^ INn[31] ^ INn[35] ^ INn[36] ^ INn[37] ^ INn[40] ^ INn[41] ^ INn[42] ^ INn[48] ^ INn[49] ^ INn[50] ^ INn[51] ^ INn[52] ^ INn[53] ^ INn[54] ^ INn[55] ^ INn[58] ^ INn[61] ^ INn[62];
       OUTt[7] <= INn[2] ^ INn[5] ^ INn[6] ^ INn[9] ^ INn[12] ^ INn[15] ^ INn[16] ^ INn[19] ^ INn[27] ^ INn[35] ^ INn[38] ^ INn[39] ^ INn[43] ^ INn[44] ^ INn[45] ^ INn[48] ^ INn[49] ^ INn[50] ^ INn[56] ^ INn[57] ^ INn[58] ^ INn[59] ^ INn[60] ^ INn[61] ^ INn[62] ^ INn[63];
    end
endmodule


