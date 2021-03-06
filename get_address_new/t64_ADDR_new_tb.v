module t64_ADDR_new_tb();

//  Input
reg [13:0] R_ADDR;
reg R_EN;
reg [63:0] real_data, wrong_real_data;
reg DB_DETECT, SB_CORRECT;

//  Output
wire [13:0] R_ADDRr;
wire [63:0] error_data;

new_de_v1 DUT0 (.R_ADDR(R_ADDR), .R_EN(R_EN), .R_ADDRr(R_ADDRr), .real_data(real_data), .wrong_real_data(wrong_real_data), .DB_DETECT(DB_DETECT), .SB_CORRECT(SB_CORRECT), .error_data(error_data) );

initial begin
#50
R_EN = 0;
DB_DETECT  = 1;
SB_CORRECT = 1;
R_ADDR = 14'd10;
real_data = 64'd10;
wrong_real_data = 64'd20;   // no read
#50
R_EN = 1;
DB_DETECT  = 0;
SB_CORRECT = 0;
R_ADDR = 14'd12;
real_data = 64'd20;
wrong_real_data = 64'd20; // no error  =>  error_data = 0 , R_ADDRr = 0
#50
DB_DETECT  = 0;
SB_CORRECT = 1;
R_ADDR = 14'd15;
real_data = 64'd60;
wrong_real_data = 64'd55; // a signel error , will be corrected  => error_data  = wrong data , R_ADDRr = addtess 
#50
DB_DETECT  = 1;
SB_CORRECT = 1;
R_ADDR = 14'd17;
real_data = 64'd5;
wrong_real_data = 64'd5;//  Multiple errors , will NOT be corrected  => error_data = real = wrong , R_ADDRr = address
end
endmodule
