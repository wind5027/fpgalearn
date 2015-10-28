
module SmgScanModule
(
    input CLK,
    input RSTn,
    output [3:0] ScanSig
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
    reg [3:0] rScan;
    always @ (posedge CLK or negedge RSTn )
        if( ! RSTn )
            begin
                i <= 4'd0;
                rScan <= 4'b1_000;
            end
        else
            case ( i )
                0:
                if( C1 == T1MS ) i <= i + 1'd1;
                else rScan <= 4'b0111;
                1:
                if( C1 == T1MS ) i <= i + 1'd1;
                else rScan <= 4'b1011;
                2:
                if( C1 == T1MS ) i <= i + 1'd1;
                else rScan <= 4'b1101;
                3:
                if( C1 == T1MS ) i <= i + 1'd1;
                else rScan <= 4'b1110;
                4:
                if( C1 == T1MS ) i <= 4'd0;
                else rScan <= 4'b0111;
            endcase
    assign ScanSig = rScan;
endmodule