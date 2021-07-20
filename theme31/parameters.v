`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/28 15:41:41
// Design Name: 
// Module Name: parameters
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
`define VGA 1
parameter LAPLACIAN = 3;
parameter MEAN = 1;
parameter NONE = 0;
parameter COOR_WIDTH = 11;

`ifdef VGA
//VGA
parameter WIDTH = 640;
parameter HEIGHT = 480;
parameter XFPORCH = 16;
parameter YFPORCH = 10;
parameter XBPORCH = 48;
parameter YBPORCH = 33;
parameter XSYNC = 96;
parameter YSYNC = 2;
parameter XBLANK = 160;
parameter YBLANK = 45;
`else
//720p 74.25MHz
/*
parameter WIDTH = 1280;
parameter HEIGHT = 720;
parameter XFPORCH = 110;
parameter YFPORCH = 5;
parameter XSYNC = 40;
parameter YSYNC = 5;
parameter XBLANK = 370;
parameter YBLANK = 30;
*/
//75MHz
///*
parameter WIDTH = 1280;
parameter HEIGHT = 720;
parameter XFPORCH = 64;
parameter YFPORCH = 3;
parameter XSYNC = 128;
parameter YSYNC = 4;
parameter XBLANK = 384;
parameter YBLANK = 29;
//*/
`endif
