`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/10 15:15:37
// Design Name: 
// Module Name: task_31_top
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


module task_31_top(
    input clk, //125MHz
	output [2:0] TMDSp, TMDSn,
    output TMDSp_clock, TMDSn_clock
);

wire pixclk;
//wire [7:0]pixel;
wire [7:0]r,g,b;
wire hsync,vsync,vvalid;

//generate pixel clock
mmcm_pix gen_pixclk(
    .CLKIN(clk),
    .CLKOUT0(pixclk)
);

//generate pixel data, vsync, hsync, and the valid signal
gen_pixel gen_pixel(
    .pixclk(pixclk),
    .pixel({r,g,b}),
    .vSync(vsync),.hSync(hsync),
    .DrawArea(vvalid)
);

//convert to hdmi signals
rgb2hdmi hdmi(
    .pixclk(pixclk), 
    .red(r), .green(g), .blue(b),
    //    .red(pixel), .green(pixel), .blue(pixel),
    .vSync(vsync), .hSync(hsync),
    .DrawArea(vvalid),
    .TMDSp(TMDSp), .TMDSn(TMDSn),
    .TMDSp_clock(TMDSp_clock), .TMDSn_clock(TMDSn_clock)
);


endmodule    

