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
    
    
   sorting_cell cell1(
         .clk(clk),.rst(rst),.en(en),
         .prev_data(31'b0),
         .new_data(input_data),
         .prev_push(1'b0), //always unpushed
         .prev_state(1'b1), //always occupied
         .cell_data(cells_data[0]),
         .cell_push(cells_push[0]),
         .cell_state(cells_state[0])
    );
    sorting_cell cell2(
          .clk(clk),.rst(rst),.en(en),
          .prev_data(cells_data[0]),
          .new_data(input_data),
          .prev_push(cells_push[0]),
          .prev_state(cells_state[0]),
          .cell_data(cells_data[1]),
          .cell_push(cells_push[1]),
          .cell_state(cells_state[1])
    );
    
    sorting_cell cell3(
          .clk(clk),.rst(rst),.en(en),
          .prev_data(cells_data[1]),
          .new_data(input_data),
          .prev_push(cells_push[1]),
          .prev_state(cells_state[1]),
          .cell_data(cells_data[2]),
          .cell_push(cells_push[2]),
          .cell_state(cells_state[2])
    );
        
    sorting_cell cell4(
          .clk(clk),.rst(rst),.en(en),
          .prev_data(cells_data[2]),
          .new_data(input_data),
          .prev_push(cells_push[2]),
          .prev_state(cells_state[2]),
          .cell_data(cells_data[3]),
          .cell_push(cells_push[3]),
          .cell_state(cells_state[3])
    ); 
    
    sorting_cell cell5(
          .clk(clk),.rst(rst),.en(en),
          .prev_data(cells_data[3]),
          .new_data(input_data),
          .prev_push(cells_push[3]),
          .prev_state(cells_state[3]),
          .cell_data(cells_data[4]),
          .cell_push(cells_push[4]),
          .cell_state(cells_state[4])
     ); 
        
    sorting_cell cell6(
           .clk(clk),.rst(rst),.en(en),
           .prev_data(cells_data[4]),
           .new_data(input_data),
           .prev_push(cells_push[4]),
           .prev_state(cells_state[4]),
           .cell_data(cells_data[5]),
           .cell_push(cells_push[5]),
           .cell_state(cells_state[5])
     ); 
            
            sorting_cell cell7(
                              .clk(clk),.rst(rst),.en(en),
                              .prev_data(cells_data[5]),
                              .new_data(input_data),
                              .prev_push(cells_push[5]),
                              .prev_state(cells_state[5]),
                              .cell_data(cells_data[6]),
                              .cell_push(cells_push[6]),
                              .cell_state(cells_state[6])
                ); 
                
                sorting_cell cell8(
                                  .clk(clk),.rst(rst),.en(en),
                                  .prev_data(cells_data[6]),
                                  .new_data(input_data),
                                  .prev_push(cells_push[6]),
                                  .prev_state(cells_state[6]),
                                  .cell_data(cells_data[7]),
                                  .cell_push(cells_push[7]),
                                  .cell_state(cells_state[7])
                    ); 
                    sorting_cell cell9(
                                      .clk(clk),.rst(rst),.en(en),
                                      .prev_data(cells_data[7]),
                                      .new_data(input_data),
                                      .prev_push(cells_push[7]),
                                      .prev_state(cells_state[7]),
                                      .cell_data(cells_data[8]),
                                      .cell_push(cells_push[8]),
                                      .cell_state(cells_state[8])
                        ); 
                        sorting_cell cell10(
                                          .clk(clk),.rst(rst),.en(en),
                                          .prev_data(cells_data[8]),
                                          .new_data(input_data),
                                          .prev_push(cells_push[8]),
                                          .prev_state(cells_state[8]),
                                          .cell_data(cells_data[9]),
                                          .cell_push(cells_push[9]),
                                          .cell_state(cells_state[9])
                            ); 
                            sorting_cell cell11(
                                              .clk(clk),.rst(rst),.en(en),
                                              .prev_data(cells_data[9]),
                                              .new_data(input_data),
                                              .prev_push(cells_push[9]),
                                              .prev_state(cells_state[9]),
                                              .cell_data(cells_data[10]),
                                              .cell_push(cells_push[10]),
                                              .cell_state(cells_state[10])
                                ); 
                                sorting_cell cell12(
                                                  .clk(clk),.rst(rst),.en(en),
                                                  .prev_data(cells_data[10]),
                                                  .new_data(input_data),
                                                  .prev_push(cells_push[10]),
                                                  .prev_state(cells_state[10]),
                                                  .cell_data(cells_data[11]),
                                                  .cell_push(cells_push[11]),
                                                  .cell_state(cells_state[11])
                                    ); 
                                    sorting_cell cell13(
                                                      .clk(clk),.rst(rst),.en(en),
                                                      .prev_data(cells_data[11]),
                                                      .new_data(input_data),
                                                      .prev_push(cells_push[11]),
                                                      .prev_state(cells_state[11]),
                                                      .cell_data(cells_data[12]),
                                                      .cell_push(cells_push[12]),
                                                      .cell_state(cells_state[12])
                                        ); 
                                        sorting_cell cell14(
                                                          .clk(clk),.rst(rst),.en(en),
                                                          .prev_data(cells_data[12]),
                                                          .new_data(input_data),
                                                          .prev_push(cells_push[12]),
                                                          .prev_state(cells_state[12]),
                                                          .cell_data(cells_data[13]),
                                                          .cell_push(cells_push[13]),
                                                          .cell_state(cells_state[13])
                                            );  
                                            sorting_cell cell15(
                                                              .clk(clk),.rst(rst),.en(en),
                                                              .prev_data(cells_data[13]),
                                                              .new_data(input_data),
                                                              .prev_push(cells_push[13]),
                                                              .prev_state(cells_state[13]),
                                                              .cell_data(cells_data[14]),
                                                              .cell_push(cells_push[14]),
                                                              .cell_state(cells_state[14])
                                                ); 
                                                sorting_cell cell16(
                                                                  .clk(clk),.rst(rst),.en(en),
                                                                  .prev_data(cells_data[14]),
                                                                  .new_data(input_data),
                                                                  .prev_push(cells_push[14]),
                                                                  .prev_state(cells_state[14]),
                                                                  .cell_data(cells_data[15]),
                                                                  .cell_push(cells_push[15]),
                                                                  .cell_state(cells_state[15])
                                                    ); 
         
 




    
    //output the sorting result
    always @(cells_data )
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







