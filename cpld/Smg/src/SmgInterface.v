
module SmgInterface
(
    input CLK,
    input RSTn,
    input [15:0] NumberSig,
    output [7:0] SmgData,
    output [3:0] ScanSig
);
    wire [3:0] NumberData;
    SmgControlModule U1
    (
        .CLK( CLK ),
        .RSTn ( RSTn ),
        .NumberSig ( NumberSig ),
        .NumberData ( NumberData )
    );
    SmgEncodeModule U2
    (
        .CLK ( CLK ),
        .RSTn ( RSTn ),
        .NumberData ( NumberData ),
        .SmgData ( SmgData )
    );
    SmgScanModule U3
    (
        .CLK ( CLK ),
        .RSTn ( RSTn ),
        .ScanSig ( ScanSig )
    );
endmodule