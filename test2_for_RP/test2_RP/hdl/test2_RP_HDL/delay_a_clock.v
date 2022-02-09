module delay_a_clock(
    input [13:0] i_R_ADDR, 
    input [7:0] i_R_DATA,
    input clk,
    output [7:0] o_R_DATA,
    output [13:0] o_R_ADDR
);

reg [13:0] o_R_ADDR_0,o_R_ADDR_1,o_R_ADDR_2;
reg [7:0] o_R_DATA_0;
//
reg [7:0] o_R_DATA_1, o_R_DATA_2;
//
assign o_R_DATA = o_R_DATA_2;
assign o_R_ADDR = o_R_ADDR_2;
/*
always@(clk) begin
    o_R_ADDR_0 <= i_R_ADDR ;
    o_R_ADDR_1 <= o_R_ADDR_0; 
end

always@(i_R_DATA)begin
    o_R_DATA_0 <= i_R_DATA;
    o_R_ADDR_2 <= o_R_ADDR_1;
end
*/



always@(clk) begin
    o_R_ADDR_0 <= i_R_ADDR ;
    o_R_ADDR_1 <= o_R_ADDR_0;
    o_R_DATA_0 <= i_R_DATA;
    o_R_DATA_1 <= o_R_DATA_0;
end

always@(i_R_DATA)begin
    o_R_DATA_2 <= o_R_DATA_1;
    o_R_ADDR_2 <= o_R_ADDR_1;
end


endmodule