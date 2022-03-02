`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:52:07 11/06/2021 
// Design Name: 
// Module Name:    sensors_input 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module sensors_input(
   output [7:0] height,
   input  [7:0] sensor1,
   input  [7:0] sensor2,
   input  [7:0] sensor3,
   input  [7:0] sensor4
	);
	
	reg [16:0] sum;
	reg [16:0] media;
	always@(*)begin
		media=0;
		sum=0;
		if(sensor1==0 || sensor3==0) begin
			sum=sensor2+sensor4;
			sum=sum+1;			//adunam cu 1 pentru corectitudinea aproximarii(explicatie->README)
			media=(sum>>1); 	//putem face fie shiftare logica, fie aritmetica pentru ca inaltimea este pozitiva, deci semnul e mereu plus
		end else if(sensor2==0 || sensor4==0) begin
			sum=sensor1+sensor3;
			sum=sum+1;
			media=(sum>>1);	//am folosit operatorul de shiftare in locul operatiei '/2', rezultatul fiind acelasi
		end else begin
			sum=sensor1+sensor3+sensor2+sensor4;
			sum=sum+2;			//adunam cu 2 pentru corectitudinea aproximarii(explicatie->README)
			media =(sum>>2);  //am folosit operatorul de shiftare in locul operatiei '/4', rezultatul fiind acelasi
		end
	end
	assign height=media;
endmodule
