module ALU (
    input [3:0] A, B,
    input [2:0] Opcode,
    output reg [3:0] Result,
    output Zero,
    output Carry
);

    wire [3:0] AddResult, SubResult, AndResult, OrResult, NotResult;
    wire CarryOut;

    // Addition
    assign {CarryOut, AddResult} = A + B;

    // Subtraction
    assign {CarryOut, SubResult} = A - B;

    // AND operation
    assign AndResult = A & B;

    // OR operation
    assign OrResult = A | B;

    // NOT operation
    assign NotResult = ~A;

    // Multiplexer to select the result based on Opcode
    always @(*) begin
        case (Opcode)
            3'b000: Result = AddResult;
            3'b001: Result = SubResult;
            3'b010: Result = AndResult;
            3'b011: Result = OrResult;
            3'b100: Result = NotResult;
            default: Result = 4'b0000;
        endcase
    end

    // Zero flag
    assign Zero = (Result == 4'b0000);

    // Carry flag
    assign Carry = CarryOut;

endmodule
