module SmgInterfaceDemo
(
    input CLK,
    input RSTn,
    output [7:0] SmgData,
    output [3:0] ScanSig
);

    wire [15:0] NumberSig;
    DemoControlModule U1
    (
        .CLK( CLK ),
        .RSTn( RSTn ),
        .NumberSig(NumberSig)
    );
    SmgInterface U2
    (
        .CLK( CLK ),
        .RSTn( RSTn ),
        .NumberSig( NumberSig ),
        .SmgData( SmgData ),
        .ScanSig( ScanSig )
    );
endmodule