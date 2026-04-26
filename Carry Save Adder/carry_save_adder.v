module full_adder(input a,b,c, output reg sum, carry);

always@(*) begin
{carry,sum} = a + b + c;
end

endmodule

module ripple_carry_adder(input [3:0] a,b, input c, output cout, output [3:0] s);

wire c1, c2, c3;

full_adder fa1(a[0],b[0],c,s[0],c1);
full_adder fa2(a[1],b[1],c1,s[1],c2);
full_adder fa3(a[2],b[2],c2,s[2],c3);
full_adder fa4(a[3],b[3],c3,s[3],cout);

endmodule

module carry_save_adder(input [3:0] a,b,c, output [4:0] s, output cout);

wire [3:0] sum, carry;

full_adder fa5(a[0], b[0], c[0], sum[0], carry[0]);
full_adder fa6(a[1], b[1], c[1], sum[1], carry[1]);
full_adder fa7(a[2], b[2], c[2], sum[2], carry[2]);
full_adder fa8(a[3], b[3], c[3], sum[3], carry[3]);
assign s[0] = sum[0];
ripple_carry_adder rca(.a(carry[3:0]),
					   .b({1'b0, sum[3:1]}),   
					   .c(1'b0),
					   .s(s[4:1]),
					   .cout(cout));
endmodule
//Wrong Approach
//ripple_carry_adder rca(.a[0](carry[0]), .b[0](sum[1]), .s[0](s[1]),
//					   .a[1](carry[1]), .b[1](sum[2]), .s[1](s[2]),
//					   .a[2](carry[2]), .b[2](sum[3]), .s[2](s[3])
//					   .a[3](carry[3]), .b[3](1'b0), .s[3](s[4]), 
//					   .cout(cout), .c(1'b0));

//Method - 2
/*ripple_carry_adder rca(
    .a({carry[3], carry[2], carry[1], carry[0]}),  // or just .a(carry)
    .b({1'b0, sum[3], sum[2], sum[1]}),
    .s({s[4], s[3], s[2], s[1]}),
    .cout(cout),
    .c(1'b0)
); */