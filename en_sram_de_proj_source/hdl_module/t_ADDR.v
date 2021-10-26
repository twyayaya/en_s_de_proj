`timescale 1ns / 1ps


module t_ADDR (input [9:0] R_ADDR, 
    input  R_EN,
    input [31:0] real_data, 
    input [31:0] wrong_real_data,
    output reg  [9:0] R_ADDRr
);

always @(*) begin
    R_ADDRr = 0;
    if(R_EN )begin
        R_ADDRr = 0;
        if(real_data != wrong_real_data)begin
            R_ADDRr = R_ADDR;
        end
    end
    
end

endmodule
