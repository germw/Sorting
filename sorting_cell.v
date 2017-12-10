`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2017 14:22:25
// Design Name: 
// Module Name: soting_cell
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


module sorting_cell(
    input clk,
    input rst,
    input en,
    input [31:0] prev_data,
    input prev_push,
    input prev_state,
    input [31:0] new_data,
    output reg [31:0] cell_data,
    output reg cell_push,
    output reg cell_state,
    output wire accept_new
    );
    
    parameter EMPTY = 1'b0;
    parameter OCCUPIED = 1'b1;
    
    
    //wire accept_new;
    //condition of changing the element in the cell
    assign accept_new = (new_data[19:12] > cell_data[19:12])
    || ((new_data[19:12] == cell_data[19:12]) && (new_data[11:0] > cell_data[11:0]));
                        
    
    
    
    wire [3:0] data_priority;
    assign data_priority = {accept_new,prev_push,cell_state,prev_state}; 
    
    
    //determine cell push
    always @(posedge clk,posedge rst)
    begin
        if(rst)
            cell_push <= 1'b0;
        else if(en)
        begin
             if((accept_new || prev_push) && (cell_state == OCCUPIED))
             cell_push <= 1'b1;
             else
             cell_push <=1'b0;
        end
    
    end
   
    
    //determine cell state
    always @(posedge clk, posedge rst)
    begin
        if (rst)
            cell_state <= EMPTY;
        
        else if (en)
        begin
            case(cell_state)
                EMPTY:
                    begin
                    if(prev_push) cell_state <= OCCUPIED;
                    else if(prev_state && accept_new) cell_state <= OCCUPIED;
                    else cell_state <= EMPTY;
                    end
                OCCUPIED:
                    cell_state <= OCCUPIED;
            endcase
        end
    
    end
    
    //determine cell data
    always @(posedge clk, posedge rst)
    begin
        if(rst)
            cell_data <= 32'b0;
        else if (en) 
        begin
            //accept_new,prev_push,cell_state,prev_state
            casez(data_priority)
                4'b?1?? : cell_data <= prev_data;
                4'b101? : cell_data <= new_data;
                4'b?001 : cell_data <= new_data;
                default : cell_data <= cell_data;
            endcase
        end
        else cell_data <= cell_data;
    end
endmodule

