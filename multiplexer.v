// Multiplexer circuit
`define NOT not #50
`define AND and #50
`define OR or #50
`define NAND nand #50
`define NOR nor #50
`define XOR xor #50

module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address1, address0};
    assign out = inputs[address];
endmodule


module structuralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);

  wire a0anda1, a0xora1, a0only, a1only;
  wire in0select, in1select, in2select;
  wire n0, n1, n0andn1, in3select;

  `AND andgate0and1(a0anda1, address0, address1);
  `AND andgatein3(in3select, in3, a0anda1);
  `XOR xorselect(a0xora1, address0, address1);
  `AND andgatea0(a0only, address0, a0xora1);
  `AND andgatea1(a1only, address1, a0xora1);
  `AND andgatein1(in1select, in1, a0only);
  `AND andgatein2(in2select, in2, a1only);
  `NOT not0(n0, address0);
  `NOT not1(n1, address1);
  `AND andgaten0andn1(n0andn1, n0, n1);
  `AND andgatein0(in0select, n0andn1, in0);
  `OR orselects(out, in0select, in1select, in2select, in3select);


endmodule
