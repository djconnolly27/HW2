// Decoder circuit
`define NOT not #50
`define AND and #50
`define OR or #50
`define NAND nand #50
`define NOR nor #50
`define XOR xor #50

module behavioralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Uses concatenation and shift operators
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


module structuralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
// out0 = n0andn1
// out1 = only 0
// out2 = only 1
// out3 = 0and1

  wire a0enable;
  wire a1enable;
  wire na0enable;
  wire na1enable;
  wire na0andna1;

  `AND andgate0enable(a0enable, address0, enable);
  `AND andgate1enable(a1enable, address1, enable);

  `NOT address0inv(na0enable, a0enable);
  `NOT address1inv(na1enable, a1enable);

  `AND andgate0and1(out3, a0enable, a1enable);
  `AND andgaten0andn1(na0andna1, na0enable, na1enable);
  `AND andgate0andn1(out1, a0enable, na1enable);
  `AND andgaten0and1(out2, na0enable, a1enable);
  `AND andgaten0n1enable(out0, enable, na0andna1);

    // Your decoder code here
endmodule
