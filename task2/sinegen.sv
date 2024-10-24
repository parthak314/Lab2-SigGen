module sinegen #(
        parameter   A_WIDTH = 8,
                    D_WIDTH = 8
)(
    input   logic                   clk,
    input   logic                   rst,
    input   logic                   en,
    input   logic   [D_WIDTH-1:0]   incr,
    output  logic   [D_WIDTH-1:0]   dout1,
    output  logic   [D_WIDTH-1:0]   dout2
);

    logic   [A_WIDTH-1:0]           address1;
    logic   [A_WIDTH-1:0]           address2;


counter addrCounter1(
    .clk (clk),
    .rst (rst),
    .en (en),
    .incr (incr),
    .count (address1)
);

counter2 addrCounter2(
    .clk (clk),
    .rst (rst),
    .en (en),
    .incr (incr),
    .count (address2)
);

rom2ports sineRom (
    .clk (clk),
    .addr1 (address1),
    .addr2 (address2),
    .dout1 (dout1),
    .dout2 (dout2)
);

endmodule
