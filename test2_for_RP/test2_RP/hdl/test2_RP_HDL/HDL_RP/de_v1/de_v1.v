`timescale 1ns / 100ps

module de_v1(
    //Iput
    INn,
    clk,

    //Output
   // SGLl,
   // DBLl,
    ERRr,
    real_data
    //wrong_real_data
);
////////////////////////////////////
input [71:0] INn;
input clk;

//output SGLl;
//output DBLl;
output ERRr;
output [63:0] real_data;
//output [63:0] wrong_real_data;
////////////////////////////////////

////////////////////////////////////
wire [71:0] de1tode2;
wire [7:0] SYNn;

////////////////////////////////////

de64_1 de1(
        // Inputs
        .IN   ( INn ),
        .clk  ( clk ),
        // Outputs
        .OUT  ( de1tode2 ),
        .SYNn ( SYNn ),
        //.SGLl ( SGLl ),
        //.DBLl ( DBLl )
        .ERRr(ERRr) 
        );

de64_2 de2(
        // Inputs
        .INn             ( de1tode2 ),
        .SYNn            ( SYNn ),
        // Outputs
        .real_data       ( real_data)
        //.wrong_real_data ( wrong_real_data ) 
        );

endmodule