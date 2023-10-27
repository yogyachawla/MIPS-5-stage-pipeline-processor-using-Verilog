`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2023 22:36:14
// Design Name: 
// Module Name: forwarding_unit
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


module forwarding_unit(

	input ex_mem_RegWrite, mem_wb_RegWrite, clk,
	input [4:0] id_ex_read_reg_1, id_ex_read_reg_2, ex_mem_write_reg, mem_wb_write_reg,
	output reg [1:0] forwardA, forwardB
	);
	
	always@ (negedge clk) begin
		if(ex_mem_RegWrite & (ex_mem_write_reg != 0) & (ex_mem_write_reg == id_ex_read_reg_1))
			forwardA <= 2'b10;
		else if(mem_wb_RegWrite & (mem_wb_write_reg != 0) & (mem_wb_write_reg == id_ex_read_reg_1))
			forwardA <= 2'b01;
		else
			forwardA <= 2'b00;
	end
	
	always@ (negedge clk) begin
		if(ex_mem_RegWrite & (ex_mem_write_reg != 0) & (ex_mem_write_reg == id_ex_read_reg_2))
			forwardB <= 2'b10;
		else if(mem_wb_RegWrite & (mem_wb_write_reg != 0) & (mem_wb_write_reg == id_ex_read_reg_2))
			forwardB <= 2'b01;
		else
			forwardB <= 2'b00;
	end
	

endmodule
