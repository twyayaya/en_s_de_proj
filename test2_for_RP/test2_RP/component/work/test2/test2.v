//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue Feb  8 01:34:48 2022
// Version: v12.5 12.900.11.2
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// test2
module test2(
    // Inputs
    CLK,
    R_ADDR,
    R_EN,
    WBYTE_EN,
    W_ADDR,
    W_DATA,
    W_EN,
    selectt,
    // Outputs
    ERRr,
    R_DATA,
    data_64_out,
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
input  [7:0]  WBYTE_EN;
input  [13:0] W_ADDR;
input  [79:0] W_DATA;
input         W_EN;
input  [63:0] selectt;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        ERRr;
output [79:0] R_DATA;
output [63:0] data_64_out;
output [13:0] error_address;
output [63:0] error_data;
output        error_flag;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          CLK;
wire   [71:0] comb_0_DatatoDecoder;
wire   [63:0] data_64_out_net_0;
wire   [63:0] data_64_out_0;
wire   [13:0] delay_a_clock_0_o_R_ADDR;
wire   [7:0]  delay_a_clock_0_o_R_DATA;
wire   [7:0]  en64_RP2_0_OUTt;
wire   [13:0] error_address_net_0;
wire   [63:0] error_data_net_0;
wire          error_flag_net_0;
wire          ERRr_net_0;
wire   [7:0]  PF_TPSRAM_C0_0_R_DATA;
wire   [13:0] R_ADDR;
wire   [79:0] R_DATA_net_0;
wire          R_EN;
wire   [63:0] real_data;
wire   [63:0] selectt;
wire   [63:0] test5_0_data_64_out;
wire   [13:0] W_ADDR;
wire   [79:0] W_DATA;
wire          W_EN;
wire   [7:0]  WBYTE_EN;
wire          error_flag_net_1;
wire   [13:0] error_address_net_1;
wire   [63:0] error_data_net_1;
wire   [79:0] R_DATA_net_1;
wire   [63:0] data_64_out_0_net_0;
wire          ERRr_net_1;
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
assign error_flag_net_1    = error_flag_net_0;
assign error_flag          = error_flag_net_1;
assign error_address_net_1 = error_address_net_0;
assign error_address[13:0] = error_address_net_1;
assign error_data_net_1    = error_data_net_0;
assign error_data[63:0]    = error_data_net_1;
assign R_DATA_net_1        = R_DATA_net_0;
assign R_DATA[79:0]        = R_DATA_net_1;
assign data_64_out_0_net_0 = data_64_out_0;
assign data_64_out[63:0]   = data_64_out_0_net_0;
assign ERRr_net_1          = ERRr_net_0;
assign ERRr                = ERRr_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------comb
comb comb_0(
        // Inputs
        .checkbits     ( delay_a_clock_0_o_R_DATA ),
        .sramdata      ( data_64_out_net_0 ),
        // Outputs
        .DatatoDecoder ( comb_0_DatatoDecoder ) 
        );

//--------de_v1
de_v1 de_v1_0(
        // Inputs
        .clk       ( GND_net ),
        .INn       ( comb_0_DatatoDecoder ),
        // Outputs
        .ERRr      ( ERRr_net_0 ),
        .real_data ( real_data ) 
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
        .INn  ( data_64_out_0 ),
        // Outputs
        .OUTt ( en64_RP2_0_OUTt ) 
        );

//--------error_gen
error_gen error_gen_0(
        // Inputs
        .INn     ( test5_0_data_64_out ),
        .selectt ( selectt ),
        // Outputs
        .OUTt    ( data_64_out_net_0 ) 
        );

//--------PF_SRAM_AHBL_AXI_C1_PF_TPSRAM_AHB_AXI_0_PF_TPSRAM
PF_SRAM_AHBL_AXI_C1_PF_TPSRAM_AHB_AXI_0_PF_TPSRAM PF_SRAM_AHBL_AXI_C1_PF_TPSRAM_AHB_AXI_0_PF_TPSRAM_0(
        // Inputs
        .W_EN     ( W_EN ),
        .R_EN     ( R_EN ),
        .CLK      ( CLK ),
        .W_DATA   ( W_DATA ),
        .W_ADDR   ( W_ADDR ),
        .R_ADDR   ( R_ADDR ),
        .WBYTE_EN ( WBYTE_EN ),
        // Outputs
        .R_DATA   ( R_DATA_net_0 ) 
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
        .data_80_in  ( R_DATA_net_0 ),
        // Outputs
        .data_64_out ( test5_0_data_64_out ) 
        );

//--------test5
test5 test5_1(
        // Inputs
        .data_80_in  ( W_DATA ),
        // Outputs
        .data_64_out ( data_64_out_0 ) 
        );

//--------test6_for_compare
test6_for_compare test6_for_compare_0(
        // Inputs
        .ERRr_signal   ( ERRr_net_0 ),
        .data_64_out   ( data_64_out_net_0 ),
        .o_R_DATA      ( real_data ),
        .o_R_ADDR      ( delay_a_clock_0_o_R_ADDR ),
        // Outputs
        .error_flag    ( error_flag_net_0 ),
        .error_address ( error_address_net_0 ),
        .error_data    ( error_data_net_0 ) 
        );


endmodule
