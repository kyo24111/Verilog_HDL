`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/14 00:13:20
// Design Name: 
// Module Name: task_21_201911955
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


module task_21_201911955(
    input clk,
    output [3:0]ld
);
reg [3:0]sreg;
reg [31:0]upcnt;
//アップカウンタ32ビット幅

parameter UMAX = 62500000-1;

initial begin
    sreg<=4'b0001;
end
always@(posedge clk)begin
    if(upcnt< UMAX)begin
        upcnt <= upcnt + 1;
    end else begin
        upcnt <= 0;
    end
end

always@(posedge clk)begin
    if(upcnt == UMAX)begin
        sreg[3] <= sreg[2];
        sreg[2] <= sreg[1];
        sreg[1] <= sreg[0];
        sreg[0] <= sreg[3];
    end
end


assign ld = sreg;
endmodule
