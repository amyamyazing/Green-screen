module buff(
	input wire rst, 
	input wire validInput,
	input wire [31:0] pixel,
	output wire [127:0] out,
	output wire validOutput
	);

   reg [1:0] counter;
   reg [31:0] p0;
   reg [31:0] p1;
   reg [31:0] p2;
   reg [31:0] p3;
   wire [31:0] val;
   assign out = {p0, p1, p2, p3};
   assign validOutput = (counter == 2'b11) ? 1 : 0;
   assign val = rst ? 0 : pixel;
   always @ (posedge validInput) begin
	counter = (counter + 2'b1) % 4;
   end
   always @ (posedge validInput) begin
	if(rst || counter == 2'b00)
		p0 = val;
	if(rst || counter == 2'b01)
		p1 = val;
	if(rst || counter == 2'b10)
		p2 = val;
	if(rst || counter == 2'b11)
		p3 = val;
   end
endmodule

	
   
