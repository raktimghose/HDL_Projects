module RAM_tb();

    reg clk, rst, w_enb; 
    reg [2:0] w_addr, r_addr;
    reg [7:0] data_in;
    wire [7:0] data_out;

    RAM dut(clk, rst, w_enb, w_addr, r_addr, data_in, data_out);
    initial begin
        {clk, rst, w_enb, w_addr, r_addr, data_in, data_out} = 0;
    end

    always #5 clk = ~clk;

    initial begin
        rst = 1;
        #10;
        rst = 0;
        w_enb = 1;
        w_addr = 3'b100;
        data_in = 5;
        #10;
        w_enb = 1;
        w_addr = 3'b101;
        data_in = 10;
        #10;
        w_enb = 0;
        r_addr = 3'b100;
        #10;
        r_addr = 3'b101;
        #10;
        $finish;
    end
endmodule