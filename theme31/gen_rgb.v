`timescale 1ns / 1ps


module gen_pixel(
	input pixclk,  // 25MHz for VGA, 74.25 MHz for 720p
    output reg hSync, vSync,DrawArea,
    output [23:0] pixel //upper 8-bits for red, intermediate 8 bits for green, and lower 8 bits for blue
);

`include "parameters.v"

wire [7:0]r,g,b;
assign pixel = {r,g,b};

reg [COOR_WIDTH-1:0] cX, cY;

initial begin
    cX <= 0;
    cY <= 0;
end

//calculate pixel coordiate 
always @(posedge pixclk)begin
    cX <= (cX==WIDTH + XBLANK-1) ? 0 : cX+1;
    if(cX == WIDTH+XBLANK-1) cY <= (cY == HEIGHT+YBLANK-1) ? 0 : cY+1;

    //generate hsync, vsync, & valid
    DrawArea <= (cX < WIDTH) && (cY < HEIGHT);    
    hSync <= (cX >= WIDTH + XFPORCH) && (cX < WIDTH + XFPORCH + XSYNC);
    vSync <= (cY >= HEIGHT + YFPORCH) && (cY < HEIGHT + YFPORCH + YSYNC); 
end

assign r = cY < HEIGHT/4 ? 8'hff: ( cY < HEIGHT/2 ? 8'h8f: (cY < 3*HEIGHT/4 ? 8'h3f:8'h00 ) ) ;
assign g = cY < HEIGHT/4 ? 8'hff: ( cY < HEIGHT/2 ? 8'h8f: (cY < 3*HEIGHT/4 ? 8'h3f:8'h00 ) ) ;
assign b = cY < HEIGHT/4 ? 8'hff: ( cY < HEIGHT/2 ? 8'h8f: (cY < 3*HEIGHT/4 ? 8'h3f:8'h00 ) ) ;

//read out the image rom
/*
wire [7:0] rom_data;
wire [31:0]rom_addr;

// instantiate a rom module
// generate rom address
*/


endmodule

