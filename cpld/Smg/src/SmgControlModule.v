
module SmgControlModule
(
    input CLK,
    input RSTn,
    input [15:0] NumberSig,
    output [3:0] NumberData
);
    parameter T1MS = 19'd500_000;
    reg [18:0] C1;
    always @ ( posedge CLK or negedge RSTn )
        if ( ! RSTn )
            C1 <= 19'd0;
        else if(C1 == T1MS )
            C1 <= 19'd0;
        else 
            C1 <= C1 + 1'd1;
    reg [3:0] i;
    reg [3:0] rNumber;
    always @ ( posedge CLK or negedge RSTn )
        if( ! RSTn )
            begin
                rNumber <= 4'd0;
                i <= 4'd0;
            end
        else
            case ( i )
                0:
                if(C1 == T1MS ) i <= i + 1'd1;
                else rNumber <= NumberSig[15:12];
                1:
                if(C1 == T1MS ) i <= i + 1'd1;
                else rNumber <= NumberSig[11:8];
                2:
                if(C1 == T1MS ) i <= i + 1'd1;
                else rNumber <= NumberSig[7:4];
                3:
                if(C1 == T1MS ) i <= 4'd0;
                else rNumber <= NumberSig[3:0];
            endcase
    assign NumberData = rNumber;
endmodule