module t64_ADDR_new (input [13:0] R_ADDR, 
    input  R_EN,
    input [63:0] real_data, 
    input [63:0] wrong_real_data,
    //new 
    input DB_DETECT,
    input SB_CORRECT,
    //
    output [63:0] error_data,
    output [13:0] R_ADDRr
);

reg [13:0] R_ADDRrr;
reg [63:0] errors;

assign R_ADDRr = R_ADDRrr;
assign error_data = errors;


always @(R_EN or wrong_real_data) begin
    R_ADDRrr = 0;
    errors = 0;
    if(R_EN )begin
        R_ADDRrr = 0;
        if( (SB_CORRECT != DB_DETECT) && (SB_CORRECT ==1) )begin // singel error , will be corrected || (real_data != wrong_real_data)
            R_ADDRrr = R_ADDR;
            errors = wrong_real_data;
        end
        if( (SB_CORRECT == 1) &&  (DB_DETECT == 1) )begin //Multiple errors NOT corrected  =>  real  data = wrong data
            R_ADDRrr = R_ADDR;
            errors = real_data;
        end
    end
    
end

endmodule
