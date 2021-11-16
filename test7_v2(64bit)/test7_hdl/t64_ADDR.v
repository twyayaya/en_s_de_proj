`timescale 1ns / 100ps


module t64_ADDR (input [13:0] R_ADDR, 
    input  R_EN,
    input [63:0] real_data, 
    input [63:0] wrong_real_data,
    output reg  [13:0] R_ADDRr
);

always @(real_data or wrong_real_data) begin
    R_ADDRr = 0;
    if(R_EN )begin
        R_ADDRr = 0;
        if(real_data != wrong_real_data)begin
            R_ADDRr = R_ADDR;
        end
    end
    
end

endmodule