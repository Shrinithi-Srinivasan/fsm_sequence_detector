module fsm_sequence_detector (
    input clk,
    input reset,
    input in,          
    output reg out    
);
    typedef enum logic [1:0] {
        S0 = 2'b00,
        S1 = 2'b01,
        S2 = 2'b10,
        S3 = 2'b11
    } state_t;
    state_t current_state, next_state;
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end
    always @(*) begin
        case (current_state)
            S0: begin
                if (in) next_state = S1;
                else next_state = S0;
                out = 0;
            end
            S1: begin
                if (in) next_state = S2;
                else next_state = S0;
                out = 0;
            end
            S2: begin
                if (in) next_state = S3;
                else next_state = S0;
                out = 0;
            end
            S3: begin
                if (in) next_state = S1;
                else next_state = S0;
                out = 1; 
            end
            default: begin
                next_state = S0;
                out = 0;
            end
        endcase
    end
endmodule
