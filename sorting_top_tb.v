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
    
    #10 rst=0;
    #10 en=1;
    
end

//50Mhz
always #10 clk = ~clk;

always @(posedge clk)
begin
    if(input_data == 32'b11111111111111111111111111111111)
    input_data<= input_data;
    else
    input_data<= input_data + 1;
end

endmodule













