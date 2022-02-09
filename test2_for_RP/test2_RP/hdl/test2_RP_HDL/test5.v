

module test5(
data_80_in,
data_64_out);

input  [79:0] data_80_in;
output [63:0] data_64_out;


assign data_64_out = {data_80_in[77] , data_80_in[76] , data_80_in[75] , data_80_in[74] , data_80_in[73] , data_80_in[72] , data_80_in[71] , data_80_in[70] ,
data_80_in[67] , data_80_in[66] , data_80_in[65] , data_80_in[64] , data_80_in[63] , data_80_in[62] , data_80_in[61] , data_80_in[60] ,
data_80_in[57] , data_80_in[56] , data_80_in[55] , data_80_in[54] , data_80_in[53] , data_80_in[52] , data_80_in[51] , data_80_in[50] ,
data_80_in[47] , data_80_in[46] , data_80_in[45] , data_80_in[44] , data_80_in[43] , data_80_in[42] , data_80_in[41] , data_80_in[40] ,  
data_80_in[37] , data_80_in[36] , data_80_in[35] , data_80_in[34] , data_80_in[33] ,data_80_in[32] ,data_80_in[31] , data_80_in[30] , 
data_80_in[27] , data_80_in[26] ,  data_80_in[25] ,  data_80_in[24] ,  data_80_in[23] ,  data_80_in[22] ,  data_80_in[21] , data_80_in[20] ,
data_80_in[17] , data_80_in[16] , data_80_in[15] , data_80_in[14] , data_80_in[13] , data_80_in[12] , data_80_in[11] ,data_80_in[10],
data_80_in[7] , data_80_in[6] , data_80_in[5] , data_80_in[4] , data_80_in[3] , data_80_in[2] , data_80_in[1] , data_80_in[0]};

endmodule

