`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2017 17:52:07
// Design Name: 
// Module Name: tb
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


module tb();

reg clk,rst,en;
reg [31:0] prev_data = 31'b0;
reg prev_push;
reg prev_state;
reg [31:0] new_data = 31'b0;
wire accept_new;
wire [31:0] cell_data;
wire cell_push;
wire cell_state;

 sorting_cell sc(
    .clk(clk),
    .rst(rst),
    .en(en),
    .prev_data(prev_data),
    .prev_push(prev_push),
    .prev_state(prev_state),
    .new_data(new_data),
    .cell_data(cell_data),
    .cell_push(cell_push),
    .cell_state(cell_state),
    .accept_new(accept_new)
    );

initial begin
    clk=0;
    en=0;
    rst=1;
    
     //Case 1: cell empty, prev cell empty -> not accept new, not push, state empty
    prev_push=0;
    prev_state=0;
    
    #10 rst=0; en=1;
    
   //Case 3: cell empty, prev cell occupied -> accept new, not push, state occupied
    #20 prev_state=1;
    
    //Case 5: cell occupied, prev cell occupied, prev push-> accept new, push, state occupied
    #20 prev_push=1;
    
    #10 prev_push=0;
    //Case 4: cell occupied, prev cell occupied prev not push -> accept new, push, state occupied
    
    
end

//50Mhz
always #10 clk = ~clk;

always @(posedge clk)
begin
    if(new_data == 32'd7)
    //Case 6: cell occupied, prev cell occupied, prev not push-> not accept new, not push, state occupied
    new_data<= new_data-1;
    else
    new_data<= new_data + 1;
end

endmodule
