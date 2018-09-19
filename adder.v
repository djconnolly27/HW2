// Adder circuita
`define NOT not #50
`define AND and #50
`define OR or #50
`define NAND nand #50
`define NOR nor #50
`define XOR xor #50

module behavioralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);

    wire AandB, AandCin, BandCin, AxorB;

    `AND andgateAB(AandB, a, b);
    `AND andgateACin(AandCin, a, carryin);
    `AND andgateBCin(BandCin, b, carryin);
    `OR orgateAllAnds(carryout, AandB, AandCin, BandCin);
    `XOR xorAB(AxorB, a, b);
    `XOR xorAll(sum, AxorB, carryin);
    // Your adder code here
endmodule
