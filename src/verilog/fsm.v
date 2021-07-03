`timescale 1ns / 1ps

module fsm(
        clk,rst,A,UP_LMT,DW_LMT,MOT_UP,MOT_DW
    );
    
    input clk,rst,A,UP_LMT,DW_LMT;
    output reg MOT_UP,MOT_DW;
    
    parameter S_wait = 0, S_raise = 1, S_close = 2;
    reg [1:0] currState,nextState;
    
    always @(posedge clk or posedge rst)
    begin
        if (rst==1) begin
            currState<=S_wait;
        end else begin
            currState<=nextState;
        end
    end
    
    always @(A,UP_LMT,DW_LMT,currState)
    begin
    MOT_UP<=1'b0; MOT_DW<=1'b0;
        case (currState)
            S_wait: begin
                if(A==0) begin
                    nextState<=S_wait;
                end else if (UP_LMT==1) begin
                    nextState<=S_close;
                end else begin
                    nextState<=S_raise;
                end
            end
            
            S_raise: begin
                MOT_UP<=1'b1;
                if(UP_LMT==1) begin
                    nextState<=S_wait;
                end else if(A==1) begin
                    nextState<=S_close;
                end else begin
                    nextState<=S_raise;
                end
            end
            
            S_close: begin
                MOT_DW<=1'b1;
                if(DW_LMT==1) begin
                    nextState<=S_wait;
                end else if(A==1) begin
                    nextState<=S_raise;
                end else begin
                    nextState<=S_close;
                end
            end
            
            default: begin
                nextState<=S_wait;
            end
        endcase
    end
endmodule
