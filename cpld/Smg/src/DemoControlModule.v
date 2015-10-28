

module DemoControlModule
(
    input CLK,
    input RSTn,
    output [15:0]NumberSig
);
    parameter T100MS = 26'd50_000_000;
    reg [25:0]C1;
    always @ ( posedge CLK or negedge RSTn )
        if( ! RSTn )
            C1 <= 26'd0;
        else if( C1 == T100MS )
            C1 <= 26'd0;
        else 
            C1 <= C1 + 1'd1;
    reg [3:0] i;
    reg [15:0]rNum;
    reg [15:0]rNumber;
    always @ ( posedge CLK or negedge RSTn )
        if ( ! RSTn )
            begin
                i <= 4'd0;
                rNum <= 16'd0;
                rNumber <= 16'd0;
            end
        else
            case( i )
                0:
                if( C1 == T100MS ) begin rNum[3:0] <= rNum[3:0] + 1'd1; i <= i + 1'd1; end
                1:
                if( rNum[3:0] > 4'd9 ) begin rNum[7:4] <= rNum[7:4] + 1'd1; rNum[3:0] <= 4'd0; i <= i + 1'd1; end
                else i <= i + 1'd1;
                2:
                if( rNum[7:4] > 4'd9 ) begin rNum[11:8] <= rNum[11:8] + 1'd1; rNum[7:4] <= 4'd0; i <= i + 1'd1; end
                else i <= i + 1'd1;
                3:
                if( rNum[11:8] > 4'd9 ) begin rNum[15:12] <= rNum[15:12] + 1'd1; rNum[11:8] <= 4'd0; i <= i + 1'd1; end
                else i <= i + 1'd1;
                4:
                if( rNum[15:12] > 4'd9 ) begin rNum <= 15'd0; rNum[11:8] <= 4'd0; i <= i + 1'd1; end
                else i <= i + 1'd1;
                5:
                begin rNumber <= 16'd1234; i <= 4'd0; end
            endcase
    assign NumberSig = rNumber;
endmodule