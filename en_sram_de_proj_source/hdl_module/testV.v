`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/08 16:48:56
// Design Name: 
// Module Name: testV
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


module testV(
    input [39:0] IN,
    output [39:0] OUT,
    input [31:0] selectt
    );
    
reg [39:0] IN_2;



always@(*) begin
    IN_2 = IN;
    case(selectt)
        32'd0  : IN_2[0] = ~IN[0] ;
        32'd1  : IN_2[1] = ~IN[1] ;
        32'd2  : IN_2[2] = ~IN[2] ;
        32'd3  : IN_2[3] = ~IN[3] ;
        32'd4  : IN_2[4] = ~IN[4] ;
        32'd5  : IN_2[5] = ~IN[5] ;
        32'd6  : IN_2[6] = ~IN[6] ;
        32'd7  : IN_2[7] = ~IN[7] ;
        32'd8  : IN_2[8] = ~IN[8] ;
        32'd9  : IN_2[9] = ~IN[9] ;
        32'd10  : IN_2[10] = ~IN[10] ;
        32'd11  : IN_2[11] = ~IN[11] ;
        32'd12  : IN_2[12] = ~IN[12] ;
        32'd13  : IN_2[13] = ~IN[13] ;
        32'd14  : IN_2[14] = ~IN[14] ;
        32'd15  : IN_2[15] = ~IN[15] ;
        32'd16  : IN_2[16] = ~IN[16] ;
        32'd17  : IN_2[17] = ~IN[17] ;
        32'd18  : IN_2[18] = ~IN[18] ;
        32'd19  : IN_2[19] = ~IN[19] ;
        32'd20  : IN_2[20] = ~IN[20] ;
        32'd21  : IN_2[21] = ~IN[21] ;
        32'd22  : IN_2[22] = ~IN[22] ;
        32'd23  : IN_2[23] = ~IN[23] ;
        32'd24  : IN_2[24] = ~IN[24] ;
        32'd25  : IN_2[25] = ~IN[25] ;
        32'd26  : IN_2[26] = ~IN[26] ;
        32'd27  : IN_2[27] = ~IN[27] ;
        32'd28  : IN_2[28] = ~IN[28] ;
        32'd29  : IN_2[29] = ~IN[29] ;
        32'd30  : IN_2[30] = ~IN[30] ;
        32'd31  : IN_2[31] = ~IN[31] ;
        
        default: IN_2 = IN ;
    endcase
end

assign OUT = IN_2;

endmodule
