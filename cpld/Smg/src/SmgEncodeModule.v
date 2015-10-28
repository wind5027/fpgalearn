
module SmgEncodeModule
(
    input CLK,
    input RSTn,
    input [3:0] NumberData,
    output [7:0] SmgData
);
    parameter
    _0 = 8'b0011_1111, _1 = 8'b0000_0110, _2 = 8'b0101_1011, 
    _3 = 8'b0100_1111, _4 = 8'b0110_0110, _5 = 8'b0110_1101, 
    _6 = 8'b0111_1101, _7 = 8'b0000_0111, _8 = 8'b0111_1111,
    _9 = 8'b0110_1111;
    reg [7:0] rSMG;
    always @ ( posedge CLK or negedge RSTn )
        if ( ! RSTn )
            rSMG <= 8'd1111_1111;
        else
            case ( NumberData )
                4'd0 : rSMG <= _0;
                4'd1 : rSMG <= _1;
                4'd2 : rSMG <= _2;
                4'd3 : rSMG <= _3;
                4'd4 : rSMG <= _4;
                4'd5 : rSMG <= _5;
                4'd6 : rSMG <= _6;
                4'd7 : rSMG <= _7;
                4'd8 : rSMG <= _8;
                4'd9 : rSMG <= _9;
            endcase
    assign SmgData = rSMG;
endmodule