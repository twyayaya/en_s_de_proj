`timescale 1ns / 1ps

module de4 (
    input [39:0] INn, 
    input [6:0] SYNn,
    output  [31:0] real_data,
    output  [31:0] wrong_real_data
);

reg [38:0] LOC;
reg [39:0] OUT;
reg [31:0] r;
reg [31:0] w;

    always @(*) begin
       case (SYNn)
           7'b0000111: LOC <= 39'h00_0000_0001; 
           7'b0001011: LOC <= 39'h00_0000_0002;
           7'b0010011: LOC <= 39'h00_0000_0004;
           7'b0100011: LOC <= 39'h00_0000_0008;
           7'b1000011: LOC <= 39'h00_0000_0010;
           7'b0001101: LOC <= 39'h00_0000_0020;
           7'b0010101: LOC <= 39'h00_0000_0040;
           7'b0100101: LOC <= 39'h00_0000_0080;
           7'b1000101: LOC <= 39'h00_0000_0100;
           7'b1110000: LOC <= 39'h00_0000_0200;
           7'b1101000: LOC <= 39'h00_0000_0400;
           7'b1100100: LOC <= 39'h00_0000_0800;
           7'b1100010: LOC <= 39'h00_0000_1000;
           7'b1100001: LOC <= 39'h00_0000_2000;
           7'b1011000: LOC <= 39'h00_0000_4000;
           7'b1010100: LOC <= 39'h00_0000_8000;
           7'b1010010: LOC <= 39'h00_0001_0000;
           7'b1010001: LOC <= 39'h00_0002_0000;
           7'b0001110: LOC <= 39'h00_0004_0000;
           7'b0011100: LOC <= 39'h00_0008_0000;
           7'b0111000: LOC <= 39'h00_0010_0000;
           7'b0010110: LOC <= 39'h00_0020_0000;
           7'b0100110: LOC <= 39'h00_0040_0000;
           7'b0011010: LOC <= 39'h00_0080_0000;
           7'b0101010: LOC <= 39'h00_0100_0000;
           7'b0110010: LOC <= 39'h00_0200_0000;
           7'b1001001: LOC <= 39'h00_0400_0000;
           7'b0101001: LOC <= 39'h00_0800_0000;
           7'b1001010: LOC <= 39'h00_1000_0000;
           7'b0011001: LOC <= 39'h00_2000_0000;
           7'b1001100: LOC <= 39'h00_4000_0000;
           7'b0110100: LOC <= 39'h00_8000_0000;
           7'b0000001: LOC <= 39'h01_0000_0000;
           7'b0000010: LOC <= 39'h02_0000_0000;
           7'b0000100: LOC <= 39'h04_0000_0000;
           7'b0001000: LOC <= 39'h08_0000_0000;
           7'b0010000: LOC <= 39'h10_0000_0000;
           7'b0100000: LOC <= 39'h20_0000_0000;
           7'b1000000: LOC <= 39'h40_0000_0000; 
           default: LOC <= 0;
        endcase
      
       OUT[38:0] <= LOC ^ INn[38:0];
       OUT[39] <= INn[39]; 
       r = OUT[31:0];
       w = INn[31:0];

    end
    
    assign wrong_real_data = w;
    assign real_data = r;
    
endmodule