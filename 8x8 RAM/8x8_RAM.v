module RAM (
    input clk,
    input rst,
    input w_enb,
    input [2:0] w_addr,
    input [2:0] r_addr, 
    input [7:0] data_in,
    output reg [7:0] data_out
);

    reg [7:0] mem [7:0]; // 8x8 RAM
    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 8; i = i + 1)
                mem[i] <= 8'b0; // Reset all memory locations to 0
            data_out <= 8'b0;   // Also reset output
        end else begin
            if (w_enb)
                mem[w_addr] <= data_in; // Write data to memory
            else
                data_out <= mem[r_addr]; // Read data from memory
        end
    end

endmodule