`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2017 15:02:49
// Design Name: 
// Module Name: sorting_top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sorting_top_tb( );

//input
reg clk=0,en=0,rst=0;
reg [31:0] input_data=32'b0;

//output
wire [31:0] sorted_data1;
wire [31:0] sorted_data2;
wire [31:0] sorted_data3;
wire [31:0] sorted_data4;
wire [31:0] sorted_data5;
wire [31:0] sorted_data6;
wire [31:0] sorted_data7;
wire [31:0] sorted_data8;
wire [31:0] sorted_data9;
wire [31:0] sorted_data10;
wire [31:0] sorted_data11;
wire [31:0] sorted_data12;
wire [31:0] sorted_data13;
wire [31:0] sorted_data14;
wire [31:0] sorted_data15;
wire [31:0] sorted_data16;

//instantiate device under test
 sorting_top tbtop(
    .clk(clk),
    .en(en),
    .rst(rst),
    .input_data(input_data),
    .sorted_data1(sorted_data1),
    .sorted_data2(sorted_data2),
    .sorted_data3(sorted_data3),
    .sorted_data4(sorted_data4),
    .sorted_data5(sorted_data5),
    .sorted_data6(sorted_data6),
    .sorted_data7(sorted_data7),
    .sorted_data8(sorted_data8),
    .sorted_data9(sorted_data9),
    .sorted_data10(sorted_data10),
    .sorted_data11(sorted_data11),
    .sorted_data12(sorted_data12),
    .sorted_data13(sorted_data13),
    .sorted_data14(sorted_data14),
    .sorted_data15(sorted_data15),
    .sorted_data16(sorted_data16)
    );

initial begin
    clk=0;
    en=0;
    rst=1;
    
    #10 rst=0; en=1;
    //31:20 ID 19:12 F 11:0 S
    #40 input_data = 32'b00000000000100000001000000000001; //101001
    #40 input_data = 32'b00000000001000000001000000000010; //201002
    #40 input_data = 32'b00000000001100000001000000000101; //301005
    //CASE 1: same F smaller S
    #40 input_data = 32'b00000000010000000001000000000011; //401003
    //CASE 2: same F larger S
    #40 input_data = 32'b00000000010100000001000000001101; //50100D
    //CASE 3: Larger F
    #40 input_data = 32'b00000000011000000100000000000101; //604005
    //CASE 4: smaller F
    #40 input_data = 32'b00000000011100000011000000101011; //70302B
    #40 input_data = 32'b00000000100000000100000001010101; //804055
    #40 input_data = 32'b00000000100100010000010100100101; //910525
    #40 input_data = 32'b00000000101001010101110000000000; //A55C00
    #40 input_data = 32'b00000000101100010010110111000000; //B12DC0
    #40 input_data = 32'b00000000110001010000101000000000; //C50A00
    #40 input_data = 32'b00000000110100000111000010100001; //D070A1
    #40 input_data = 32'b00000000111000000010100100000001; //E02901
    #40 input_data = 32'b00000000111101011100000010000010; //F5C082
    #40 input_data = 32'b00000001000001011100000010000011; //105C083
    #40 input_data = 32'b00000001000101110000000000010000; //1170010
    #40 input_data = 32'b00000001001000000100100010000111; //1204887
    #40 input_data = 32'b00000001001100010000100001000011; //1310843
    #40 input_data = 32'b00000001010000100100000000010010; //1424012    
    #40 input_data = 32'b0;                  
    
    
end

//50Mhz
always #20 clk = ~clk;


endmodule













