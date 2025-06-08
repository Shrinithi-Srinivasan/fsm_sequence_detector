module tb_fsm_sequence_detector;
    reg clk;
    reg reset;
    reg in;
    wire out;
    fsm_sequence_detector uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );
    always #5 clk = ~clk;
    initial begin
        $dumpfile("dumpfile.vcd");
    	$dumpvars(1);
        clk = 0;
        reset = 1;
        in = 0;
        #10;
        reset = 0;
        #10 in = 1;  
        #10 in = 1;
        #10 in = 1;  
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;  
        #10 in = 1; 
        #50;
        $stop;
    end
    initial begin
        $monitor("Time = %0d, in = %b, out = %b, state = %b", $time, in, out, uut.current_state);
    end
endmodule
