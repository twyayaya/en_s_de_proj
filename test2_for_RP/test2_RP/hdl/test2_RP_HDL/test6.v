

module test6_for_compare( data_64_out, o_R_DATA, o_R_ADDR,error_address, error_data,error_flag,ERRr_signal );

input [63:0] data_64_out;
input [63:0] o_R_DATA;
input [13:0] o_R_ADDR;
input ERRr_signal;


output [63:0] error_data;
output [13:0] error_address;
output error_flag;

reg [63:0] error_data_0;
reg [13:0] error_address_0;
reg error_flag_0;

assign error_data = error_data_0;
assign error_address = error_address_0;
assign error_flag = error_flag_0;

always@(*) begin
    if(ERRr_signal) begin
        error_data_0    = data_64_out;
        error_address_0 = o_R_ADDR;
        error_flag_0    = 1;
    end
    else begin
        error_data_0    = 0;
        error_address_0 = 0;
        error_flag_0    = 0;
    end


end

endmodule

