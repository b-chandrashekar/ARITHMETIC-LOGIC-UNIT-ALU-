module ALU_tb;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] Opcode;

    // Outputs
    wire [3:0] Result;
    wire Zero;
    wire Carry;

    // Instantiate the ALU
    ALU uut (
        .A(A),
        .B(B),
        .Opcode(Opcode),
        .Result(Result),
        .Zero(Zero),
        .Carry(Carry)
    );

    // Testbench logic
    initial begin
        // Test ADD operation
        A = 4'b0011; B = 4'b0101; Opcode = 3'b000; // 3 + 5 = 8
        #10;
        $display("ADD: A = %b, B = %b, Result = %b, Zero = %b, Carry = %b", A, B, Result, Zero, Carry);

        // Test SUB operation
        A = 4'b0111; B = 4'b0010; Opcode = 3'b001; // 7 - 2 = 5
        #10;
        $display("SUB: A = %b, B = %b, Result = %b, Zero = %b, Carry = %b", A, B, Result, Zero, Carry);

        // Test AND operation
        A = 4'b1010; B = 4'b1100; Opcode = 3'b010; // 1010 AND 1100 = 1000
        #10;
        $display("AND: A = %b, B = %b, Result = %b, Zero = %b, Carry = %b", A, B, Result, Zero, Carry);

        // Test OR operation
        A = 4'b1010; B = 4'b1100; Opcode = 3'b011; // 1010 OR 1100 = 1110
        #10;
        $display("OR: A = %b, B = %b, Result = %b, Zero = %b, Carry = %b", A, B, Result, Zero, Carry);

        // Test NOT operation
        A = 4'b1010; B = 4'b0000; Opcode = 3'b100; // NOT 1010 = 0101
        #10;
        $display("NOT: A = %b, Result = %b, Zero = %b, Carry = %b", A, Result, Zero, Carry);

        // Test Zero flag
        A = 4'b0000; B = 4'b0000; Opcode = 3'b000; // 0 + 0 = 0
        #10;
        $display("Zero Flag Test: A = %b, B = %b, Result = %b, Zero = %b, Carry = %b", A, B, Result, Zero, Carry);

        // Test Carry flag
        A = 4'b1111; B = 4'b0001; Opcode = 3'b000; // 15 + 1 = 16 (Carry out)
        #10;
        $display("Carry Flag Test: A = %b, B = %b, Result = %b, Zero = %b, Carry = %b", A, B, Result, Zero, Carry);

        // End simulation
        $stop;
    end

endmodule
