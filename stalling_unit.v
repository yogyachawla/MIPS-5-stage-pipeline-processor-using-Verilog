`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2023 23:47:04
// Design Name: 
// Module Name: stalling_unit
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


module stalling_unit(
	input clk, id_ex_MemRead,
	input [4:0] if_id_Rs, if_id_Rt, id_ex_Rt,
	output reg [2:0] stall
	);
	
	always@ (posedge clk) begin
		if(id_ex_MemRead & ((id_ex_Rt == if_id_Rs) | (id_ex_Rt == if_id_Rt)))
			stall <= 1;
		else
			stall <= 0;
	end
	
	/*reg check;
	
	always@(*)
	check <= id_ex_MemRead & ((id_ex_Rt == if_id_Rs) | (id_ex_Rt == if_id_Rt));
	
	always@(*) begin
	if(check)
			stall <= 1;
		else
			stall <= 0;
	end*/
			
	//assign stall = (id_ex_MemRead && ((id_ex_Rt == if_id_Rs) || (id_ex_Rt == if_id_Rt)))? 1:0;
	
endmodule
