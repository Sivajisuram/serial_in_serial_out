
module siso(

    input clk,rst,
    input sin,
    output s_out, ref_clk );
    
    integer count;
    reg d_clk;
    reg [3:0] shift_reg;
    
    always @(posedge clk or posedge rst)begin
    if(rst)begin
    count <= 32'd0;
    d_clk <= 0;
    end
    else if(count == 100_000_000)begin
    d_clk <= ~d_clk;
    count <= 32'd0;
    end
    else count = count +1;
end

always @(posedge d_clk or posedge rst)begin
if(rst)begin
shift_reg <= 4'b0000;
end
else
shift_reg <= {shift_reg[2:0],sin};
end
assign s_out = shift_reg[3];
assign ref_clk = d_clk; //ref_clk ----> LED
endmodule
