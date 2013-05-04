/* This module keeps a FIFO filled that then outputs to the DVI module. */

module PixelFeeder( //System:
                    input          cpu_clk_g,
                    input          clk50_g, // DVI Clock
                    input          rst,
                    //DDR2 FIFOS:
                    input          rdf_valid,
                    input          af_full,
                    input  [127:0] rdf_dout,
                    output         rdf_rd_en,
                    output         af_wr_en,
                    output [30:0]  af_addr_din,
                    // DVI module:
                    output reg [23:0] video,
                    output reg        video_valid,
                    input          video_ready);

    // Hint: States
    localparam IDLE = 1'b0;
    localparam FETCH = 1'b1;

    reg  [31:0] ignore_count;

    /**************************************************************************
    * YOUR CODE HERE: Write logic to keep the FIFO as full as possible.
    **************************************************************************/
    reg valid;
    //reg [127:0] dout;
    wire feeder_full;
    wire [31:0] feeder_dout;


    /* We drop the first frame to allow the buffer to fill with data from
    * DDR2. This gives alignment of the frame. */
    always @(posedge cpu_clk_g) begin
       if(rst)
            ignore_count <= 32'd480000; // 600*800 
       else if(ignore_count != 0 & video_ready)
            ignore_count <= ignore_count - 32'b1;
       else
            ignore_count <= ignore_count;
    end

    // FIFO to buffer the reads with a write width of 128 and read width of 32. We try to fetch blocks
    // until the FIFO is full.
  /*  pixel_fifo feeder_fifo(
    	.rst(rst),
    	.wr_clk(cpu_clk_g),
    	.rd_clk(clk50_g),
    	.din(rdf_dout),
    	.wr_en(rdf_valid),
    	.rd_en(video_ready & ignore_count == 0),
    	.dout(feeder_dout),
    	.full(feeder_full),
    	.empty(feeder_empty));
*/

    pixel_fifo feeder_fifo(
    	.rst(rst),
    	.wr_clk(cpu_clk_g),
    	.rd_clk(clk50_g),
    	.din(rdf_dout), //input
    	.wr_en(valid), //input
    	.rd_en(video_ready),
    	.dout(feeder_dout),
    	.full(feeder_full),
    	.empty(feeder_empty));



    always @(posedge cpu_clk_g) begin
	if(!feeder_full && rdf_valid) begin
		valid <= 1;
	end
	else begin
		valid <= 0;
	end
    end 
	 
	 
    //assign dout = 128'hffffffffffffffffffffffffffffffff;
    //assign valid = 1'b1;


    always @(*) begin
        if (video_ready && ~feeder_empty) begin
            video = feeder_dout[23:0];
            video_valid = 1'b1;
        end 
		  else begin
		      video = 24'b0;
            video_valid = 1'b0;	  
		  end
    end

    assign rdf_rd_en = video_ready && ~feeder_empty;
    assign af_wr_en = rdf_valid;
    assign af_addr_din = 31'b0;
	 
	
//	 wire [35:0] chipscope_control;
//    chipscope_icon icon(
//    .CONTROL0(chipscope_control)
//    ) /* synthesis syn_noprune = 1 */;
//    chipscope_ila ila(
//    .CONTROL(chipscope_control),
//    .CLK(cpu_clk_g),
//    .DATA({rst, cpu_clk_g, clk50_g, video, video_valid, feeder_dout}),
//    .TRIG0(rst)
//    ) /* synthesis syn_noprune = 1 */;

endmodule
