`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:53:30 11/06/2021 
// Design Name: 
// Module Name:    square_root 
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
module square_root (
    output reg [15:0] out,
    input  [7:0] in );
	 
reg [15:0] base;
reg [15:0] i;
reg [15:0] x;
reg [31:0] maxx;

always@(*) begin

//PARTEA INTREAGA
		base = 128;
		out = 0;
		for(i=0; i<8; i=i+1) begin
		out = out + base;
		
		if((out*out) > in) begin
		out = out - base;
		
		end
		//out = out <<8;
		base = base/2;
		end
		out = out <<8;
		x=in<<8;
//PARTEA FRACTIONARA 

		base = 128;
		maxx = 0;
	//i=0;
	for(i=0; i<8; i=i+1) begin
		out = out + base;
		maxx = out*out;
		
		maxx=maxx>>8;
		if(maxx >= x) begin
		out = out - base;
		end
		//out = out <<8;
		base = base/2;
end		

end
endmodule
