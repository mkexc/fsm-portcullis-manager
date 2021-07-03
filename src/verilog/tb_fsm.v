`timescale 1ns / 1ps

module tb_fsm();

    reg clk_s,rst_s,A_s,UP_LMT_s,DW_LMT_s;
    wire MOT_UP_s, MOT_DW_s;
    
    fsm dut(clk_s,rst_s,A_s,UP_LMT_s,DW_LMT_s,MOT_UP_s,MOT_DW_s);
    
    always
    begin
        clk_s<=1'b0;
        #5;
        clk_s<=1'b1;
        #5;
    end
    
    initial
    begin
        rst_s<=1'b1;
        @(posedge(clk_s)); #3;
        rst_s<=1'b0;
        UP_LMT_s<=1'b1; A_s<=1'b1; DW_LMT_s<=1'b0;
        @(posedge(clk_s)); #3; UP_LMT_s<=1'b0; A_s<=1'b0;
        @(posedge(clk_s)); #3;
        @(posedge(clk_s)); #3; DW_LMT_s<=1'b1;
        @(posedge(clk_s)); #3; DW_LMT_s<=1'b0;
        @(posedge(clk_s)); #3;
        @(posedge(clk_s)); #3;
        A_s<=1'b1; UP_LMT_s<=1'b1;
        @(posedge(clk_s)); #3;
        A_s<=1'b1; UP_LMT_s<=1'b0;
        @(posedge(clk_s)); #3; A_s<=1'b0;
        @(posedge(clk_s)); #3; UP_LMT_s<=1'b1;
        @(posedge(clk_s)); #3; UP_LMT_s<=1'b0;
        A_s<=1'b1;
        @(posedge(clk_s)); #3;
        @(posedge(clk_s)); #3;
    end
endmodule
