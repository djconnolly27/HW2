// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
  // Your test code here
  reg in0, in1, in2, in3;
  reg address0, address1;
  wire out;

  //behavioralMultiplexer multiplexer (out,address0,address1,in0,in1,in2,in3);
  structuralMultiplexer multiplexer (out,address0,address1,in0,in1,in2,in3);

  initial begin
  $display("in0 in1 in2 in3| a0 a1| out | Expected Output");
  in0=0;in1=0;in2=0;in3=0;address0=0;address1=0; #1000
  $display("%b   %b   %b   %b  | %b  %b |  %b  | 0", in0, in1, in2, in3, address0, address1, out);
  in0=1;in1=0;in2=0;in3=0;address0=0;address1=0; #1000
  $display("%b   %b   %b   %b  | %b  %b |  %b  | 1", in0, in1, in2, in3, address0, address1, out);
  in0=0;in1=0;in2=0;in3=0;address0=1;address1=0; #1000
  $display("%b   %b   %b   %b  | %b  %b |  %b  | 0", in0, in1, in2, in3, address0, address1, out);
  in0=0;in1=1;in2=0;in3=0;address0=1;address1=0; #1000
  $display("%b   %b   %b   %b  | %b  %b |  %b  | 1", in0, in1, in2, in3, address0, address1, out);
  in0=0;in1=0;in2=0;in3=0;address0=0;address1=1; #1000
  $display("%b   %b   %b   %b  | %b  %b |  %b  | 0", in0, in1, in2, in3, address0, address1, out);
  in0=0;in1=0;in2=1;in3=0;address0=0;address1=1; #1000
  $display("%b   %b   %b   %b  | %b  %b |  %b  | 1", in0, in1, in2, in3, address0, address1, out);
  in0=0;in1=0;in2=0;in3=0;address0=1;address1=1; #1000
  $display("%b   %b   %b   %b  | %b  %b |  %b  | 0", in0, in1, in2, in3, address0, address1, out);
  in0=0;in1=0;in2=0;in3=1;address0=1;address1=1; #1000
  $display("%b   %b   %b   %b  | %b  %b |  %b  | 1", in0, in1, in2, in3, address0, address1, out);
  end

  initial begin
  in0=0;in1=0;in2=0;in3=0;address0=0;address1=0; #1000
  $dumpfile("multiplexer.vcd");
  $dumpvars(0, testMultiplexer);
  end

endmodule
