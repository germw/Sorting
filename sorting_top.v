`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2017 14:22:25
// Design Name: 
// Module Name: sorting_top
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


module sorting_top(
    input clk,
    input en,
    input rst,
    input [31:0] input_data,
    output reg [31:0] sorted_data1,
    output reg [31:0] sorted_data2,
    output reg [31:0] sorted_data3,
    output reg [31:0] sorted_data4,
    output reg [31:0] sorted_data5,
    output reg [31:0] sorted_data6,
    output reg [31:0] sorted_data7,
    output reg [31:0] sorted_data8,
    output reg [31:0] sorted_data9,
    output reg [31:0] sorted_data10,
    output reg [31:0] sorted_data11,
    output reg [31:0] sorted_data12,
    output reg [31:0] sorted_data13,
    output reg [31:0] sorted_data14,
    output reg [31:0] sorted_data15,
    output reg [31:0] sorted_data16
    );
    
    parameter SIZE =16;
    
    wire [15:0] cells_state;
    wire [31:0] cells_data [15:0]; //16 32bits register
    wire [15:0] cells_push;
    
    
    
    generate 
    genvar  i;
        for(i=0; i<SIZE; i=i+1) 
        begin : sorting
            if( i == 0)  //first sorting cell
            begin
                sorting_cell(
                .clk(clk),.rst(rst),.en(en),
                .prev_data('b0),
                .new_data(input_data),
                .prev_push('b0), //always unpushed
                .prev_state('b1), //always occupied
                .cell_data(cells_data[i]),
                .cell_push(cells_push[i]),
                .cell_state(cells_state[i])
                );
            end
            
            else
            begin
                sorting_cell(
                .clk(clk),.rst(rst),.en(en),
                .prev_data(cells_data[i-1]),
                .new_data(input_data),
                .prev_push(cells_push[i-1]),
                .prev_state(cells_state[i-1]),
                .cell_data(cells_data[i]),
                .cell_push(cells_push[i]),
                .cell_state(cells_state[i])
                );
            end
        end
    endgenerate
    
    //output the sorting result
    always @(posedge clk)
    begin
        sorted_data1 <= cells_data[0];
        sorted_data2 <= cells_data[1];
        sorted_data3 <= cells_data[2];
        sorted_data4 <= cells_data[3];
        sorted_data5 <= cells_data[4];
        sorted_data6 <= cells_data[5];
        sorted_data7 <= cells_data[6];
        sorted_data8 <= cells_data[7];
        sorted_data9 <= cells_data[8];
        sorted_data10 <= cells_data[9];
        sorted_data11 <= cells_data[10];
        sorted_data12 <= cells_data[11];
        sorted_data13 <= cells_data[12];
        sorted_data14 <= cells_data[13];
        sorted_data15 <= cells_data[14];
        sorted_data16 <= cells_data[15];
        
    end
    
    
endmodule







