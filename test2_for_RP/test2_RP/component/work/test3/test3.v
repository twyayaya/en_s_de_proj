//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sat Jan 22 17:42:56 2022
// Version: v12.5 12.900.11.2
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// test3
module test3(
    // Inputs
    CLK,
    R_ADDR,
    R_EN,
    W_ADDR,
    W_EN,
    data_80_in_from_SRAM,
    data_80_out_from_SRAM,
    // Outputs
    error_address,
    error_data,
    error_flag
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         CLK;
input  [13:0] R_ADDR;
input         R_EN;
input  [13:0] W_ADDR;
input         W_EN;
input  [79:0] data_80_in_from_SRAM;
input  [79:0] data_80_out_from_SRAM;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [13:0] error_address;
output [63:0] error_data;
output        error_flag;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          CLK;
wire   [71:0] comb_0_DatatoDecoder;
wire   [79:0] data_80_in_from_SRAM;
wire   [79:0] data_80_out_from_SRAM;
wire          de_v1_0_ERRr;
wire   [63:0] de_v1_0_real_data;
wire   [13:0] delay_a_clock_0_o_R_ADDR;
wire   [7:0]  delay_a_clock_0_o_R_DATA;
wire   [7:0]  en64_RP2_0_OUTt;
wire   [13:0] error_address_net_0;
wire   [63:0] error_data_net_0;
wire          error_flag_net_0;
wire   [7:0]  PF_TPSRAM_C0_0_R_DATA;
wire   [13:0] R_ADDR;
wire          R_EN;
wire   [63:0] test5_0_data_64_out;
wire   [63:0] test5_1_data_64_out;
wire   [13:0] W_ADDR;
wire          W_EN;
wire   [63:0] error_data_net_1;
wire          error_flag_net_1;
wire   [13:0] error_address_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign error_data_net_1    = error_data_net_0;
assign error_data[63:0]    = error_data_net_1;
assign error_flag_net_1    = error_flag_net_0;
assign error_flag          = error_flag_net_1;
assign error_address_net_1 = error_address_net_0;
assign error_address[13:0] = error_address_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------comb
comb comb_0(
        // Inputs
        .checkbits     ( delay_a_clock_0_o_R_DATA ),
        .sramdata      ( test5_1_data_64_out ),
        // Outputs
        .DatatoDecoder ( comb_0_DatatoDecoder ) 
        );

//--------de_v1
de_v1 de_v1_0(
        // Inputs
        .clk       ( GND_net ),
        .INn       ( comb_0_DatatoDecoder ),
        // Outputs
        .ERRr      ( de_v1_0_ERRr ),
        .real_data ( de_v1_0_real_data ) 
        );

//--------delay_a_clock
delay_a_clock delay_a_clock_0(
        // Inputs
        .clk      ( CLK ),
        .i_R_ADDR ( R_ADDR ),
        .i_R_DATA ( PF_TPSRAM_C0_0_R_DATA ),
        // Outputs
        .o_R_DATA ( delay_a_clock_0_o_R_DATA ),
        .o_R_ADDR ( delay_a_clock_0_o_R_ADDR ) 
        );

//--------en64_RP2
en64_RP2 en64_RP2_0(
        // Inputs
        .clk  ( CLK ),
        .INn  ( test5_0_data_64_out ),
        // Outputs
        .OUTt ( en64_RP2_0_OUTt ) 
        );

//--------PF_TPSRAM_C0
PF_TPSRAM_C0 PF_TPSRAM_C0_0(
        // Inputs
        .W_EN   ( W_EN ),
        .CLK    ( CLK ),
        .R_EN   ( R_EN ),
        .W_DATA ( en64_RP2_0_OUTt ),
        .W_ADDR ( W_ADDR ),
        .R_ADDR ( R_ADDR ),
        // Outputs
        .R_DATA ( PF_TPSRAM_C0_0_R_DATA ) 
        );

//--------test5
test5 test5_0(
        // Inputs
        .data_80_in  ( data_80_in_from_SRAM ),
        // Outputs
        .data_64_out ( test5_0_data_64_out ) 
        );

//--------test5
test5 test5_1(
        // Inputs
        .data_80_in  ( data_80_out_from_SRAM ),
        // Outputs
        .data_64_out ( test5_1_data_64_out ) 
        );

//--------test6_for_compare
test6_for_compare test6_for_compare_0(
        // Inputs
        .ERRr_signal   ( de_v1_0_ERRr ),
        .data_64_out   ( test5_1_data_64_out ),
        .o_R_DATA      ( de_v1_0_real_data ),
        .o_R_ADDR      ( delay_a_clock_0_o_R_ADDR ),
        // Outputs
        .error_flag    ( error_flag_net_0 ),
        .error_address ( error_address_net_0 ),
        .error_data    ( error_data_net_0 ) 
        );


endmodule
