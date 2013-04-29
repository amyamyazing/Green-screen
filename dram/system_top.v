//-----------------------------------------------------------------------------
// system_top.v
//-----------------------------------------------------------------------------

module system_top
  (
    fpga_0_RS232_Uart_1_RX_pin,
    fpga_0_RS232_Uart_1_TX_pin,
    fpga_0_DDR2_SDRAM_DDR2_Clk_pin,
    fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin,
    fpga_0_DDR2_SDRAM_DDR2_CE_pin,
    fpga_0_DDR2_SDRAM_DDR2_CS_n_pin,
    fpga_0_DDR2_SDRAM_DDR2_ODT_pin,
    fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin,
    fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin,
    fpga_0_DDR2_SDRAM_DDR2_WE_n_pin,
    fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin,
    fpga_0_DDR2_SDRAM_DDR2_Addr_pin,
    fpga_0_DDR2_SDRAM_DDR2_DQ_pin,
    fpga_0_DDR2_SDRAM_DDR2_DM_pin,
    fpga_0_DDR2_SDRAM_DDR2_DQS_pin,
    fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin,
    fpga_0_clk_1_sys_clk_pin,
    fpga_0_rst_1_sys_rst_pin,
    readbgcop_0_OUTBG_Port_pin,
    clockgoing_pin,
	 clock_generator_0_CLKOUT4_pin,
	 clock_generator_0_CLKOUT5_pin,
    readfgcop_0_OUTFG_Port_pin,
	 proc_sys_reset_0_Interconnect_aresetn_pin,
	 //DVI ports
	 GPIO_SW_C,
    GPIO_SW_S,
    USER_CLK,

	 DVI_D,
    DVI_DE,
    DVI_H,
    DVI_RESET_B,
    DVI_V,
    DVI_XCLK_N,
    DVI_XCLK_P,
  
    IIC_SCL_VIDEO,
    IIC_SDA_VIDEO
  );
  input fpga_0_RS232_Uart_1_RX_pin;
  output fpga_0_RS232_Uart_1_TX_pin;
  output [1:0] fpga_0_DDR2_SDRAM_DDR2_Clk_pin;
  output [1:0] fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin;
  output [1:0] fpga_0_DDR2_SDRAM_DDR2_CE_pin;
  output [1:0] fpga_0_DDR2_SDRAM_DDR2_CS_n_pin;
  output [1:0] fpga_0_DDR2_SDRAM_DDR2_ODT_pin;
  output fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin;
  output fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin;
  output fpga_0_DDR2_SDRAM_DDR2_WE_n_pin;
  output [1:0] fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin;
  output [12:0] fpga_0_DDR2_SDRAM_DDR2_Addr_pin;
  inout [63:0] fpga_0_DDR2_SDRAM_DDR2_DQ_pin;
  output [7:0] fpga_0_DDR2_SDRAM_DDR2_DM_pin;
  inout [7:0] fpga_0_DDR2_SDRAM_DDR2_DQS_pin;
  inout [7:0] fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin;
  input fpga_0_clk_1_sys_clk_pin;
  input fpga_0_rst_1_sys_rst_pin;
  output readbgcop_0_OUTBG_Port_pin;
  output clockgoing_pin;
  output clock_generator_0_CLKOUT4_pin;
  output clock_generator_0_CLKOUT5_pin;
  output readfgcop_0_OUTFG_Port_pin;
  output proc_sys_reset_0_Interconnect_aresetn_pin;
  reg bg_valid;
  reg fg_valid;
  //DVI 
  input        GPIO_SW_C;
  input        GPIO_SW_S;
  input        USER_CLK;

  //output [7:0] GPIO_LED;
  output [11:0] DVI_D;
  output        DVI_DE;
  output        DVI_H;
  output        DVI_RESET_B;
  output        DVI_V;
  output        DVI_XCLK_N;
  output        DVI_XCLK_P;
  
  inout         IIC_SCL_VIDEO;
  inout         IIC_SDA_VIDEO;

  wire         pixel_rdf_rd_en;
  wire         pixel_af_wr_en;
  wire [30:0]  pixel_af_addr_din;
  wire         pixel_af_full;
  wire         pixel_rdf_valid;

  wire         video_ready;
  wire         video_valid;
  wire [23:0]  video;
  wire init_done;
  wire bg_full;
  wire fg_full;
 assign init_done = 1;
  (* BOX_TYPE = "user_black_box" *)
  system
    system_i (
      .fpga_0_RS232_Uart_1_RX_pin ( fpga_0_RS232_Uart_1_RX_pin ),
      .fpga_0_RS232_Uart_1_TX_pin ( fpga_0_RS232_Uart_1_TX_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_Clk_pin ( fpga_0_DDR2_SDRAM_DDR2_Clk_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin ( fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_CE_pin ( fpga_0_DDR2_SDRAM_DDR2_CE_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_CS_n_pin ( fpga_0_DDR2_SDRAM_DDR2_CS_n_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_ODT_pin ( fpga_0_DDR2_SDRAM_DDR2_ODT_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin ( fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin ( fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_WE_n_pin ( fpga_0_DDR2_SDRAM_DDR2_WE_n_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin ( fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_Addr_pin ( fpga_0_DDR2_SDRAM_DDR2_Addr_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_DQ_pin ( fpga_0_DDR2_SDRAM_DDR2_DQ_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_DM_pin ( fpga_0_DDR2_SDRAM_DDR2_DM_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_DQS_pin ( fpga_0_DDR2_SDRAM_DDR2_DQS_pin ),
      .fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin ( fpga_0_DDR2_SDRAM_DDR2_DQS_n_pin ),
      .fpga_0_clk_1_sys_clk_pin ( fpga_0_clk_1_sys_clk_pin ),
      .fpga_0_rst_1_sys_rst_pin ( fpga_0_rst_1_sys_rst_pin ),
      .readbgcop_0_OUTBG_Port_pin ( readbgcop_0_OUTBG_Port_pin ),
      .clockgoing_pin ( clockgoing_pin ),
      .readfgcop_0_OUTFG_Port_pin ( readfgcop_0_OUTFG_Port_pin ),
		.clock_generator_0_CLKOUT4_pin(clock_generator_0_CLKOUT4_pin),
		.clock_generator_0_CLKOUT5_pin(clock_generator_0_CLKOUT5_pin),
		.proc_sys_reset_0_Interconnect_aresetn_pin(proc_sys_reset_0_Interconnect_aresetn_pin)
    );
	 
    reg [127:0] bgin;
	 reg [127:0] fgin;
    reg [1:0] count;
	 always @ (*) begin
	   if(!bg_full) begin
	    if(count == 0) begin
			  bgin[31 : 0] =  readbgcop_0_OUTBG_Port_pin;
			  fgin[31 : 0] =  readfgcop_0_OUTFG_Port_pin;
			  bg_valid = 0;
		     fg_valid = 0;
			  count = count + 1;
		 end 
		 else if(count == 1) begin
			  bgin[63 : 32] =  readbgcop_0_OUTBG_Port_pin;
			  fgin[63 : 32] =  readfgcop_0_OUTFG_Port_pin;	
		     bg_valid = 0;
		     fg_valid = 0;			  
			  count = count + 1;
		 end
		 else if(count == 2) begin
			  bgin[95 : 64] =  readbgcop_0_OUTBG_Port_pin;
			  fgin[95 : 64] =  readfgcop_0_OUTFG_Port_pin;	
		     bg_valid = 0;
		     fg_valid = 0;
           count = count + 1;			  
		 end 
		 else begin//count = 3 
			  bgin[127 : 96] =  readbgcop_0_OUTBG_Port_pin;
			  fgin[127 : 96] =  readfgcop_0_OUTFG_Port_pin;		     
		     bg_valid = 1;
		     fg_valid = 1;
			  count = 0;
		 end
	   end
	 end

	
	 pixel_fifo bg_fifo(
    	.rst(~proc_sys_reset_0_Interconnect_aresetn_pin),
    	.wr_clk(clockgoing_pin),
    	.rd_clk(clockgoing_pin),
    	.din(bgin), //input
    	.wr_en(bg_valid), //input
    	.rd_en(bg_ready),
    	.dout(bg_dout),
    	.full(bg_full),
    	.empty(bg_empty));
		
	 pixel_fifo fg_fifo(
    	.rst(~proc_sys_reset_0_Interconnect_aresetn_pin),
    	.wr_clk(clockgoing_pin),
    	.rd_clk(clockgoing_pin),
    	.din(fgin), //input
    	.wr_en(fg_valid), //input
    	.rd_en(fg_ready),
    	.dout(fg_dout),
    	.full(fg_full),
    	.empty(fg_empty));
		
/*	
	GreenScreen gs (
		.bg(bg_dout),
		.fg(fg_dout),
		.Result(result));
*/


    PixelFeeder pixelfeed(
        .cpu_clk_g(clockgoing_pin), 
        .clk50_g(clock_generator_0_CLKOUT4_pin), 
		  .chipscope_clk(clock_generator_0_CLKOUT5_pin),
        .rst(~proc_sys_reset_0_Interconnect_aresetn_pin || ~init_done),
        .rdf_valid(pixel_rdf_valid),
        .af_full(pixel_af_full),
        .rdf_dout(rdf_dout), //result from gs goes as input here
        .rdf_rd_en(pixel_rdf_rd_en),
        .af_wr_en(pixel_af_wr_en),
        .af_addr_din(pixel_af_addr_din),
        .video(video),
        .video_valid(video_valid),
        .video_ready(video_ready));
		  
    DVI #(
        .ClockFreq(                 50000000),
        .Width(                     1040),   
        .FrontH(                    56),     
        .PulseH(                    120),    
        .BackH(                     64),    
        .Height(                    666),    
        .FrontV(                    37),      
        .PulseV(                    6),      
        .BackV(                     23)      
      ) dvi(         
        .Clock(                     clockgoing_pin),
        .Reset(                     ~proc_sys_reset_0_Interconnect_aresetn_pin || ~init_done),
        .DVI_D(                     DVI_D),
        .DVI_DE(                    DVI_DE),
        .DVI_H(                     DVI_H),
        .DVI_V(                     DVI_V),
        .DVI_RESET_B(               DVI_RESET_B),
        .DVI_XCLK_N(                DVI_XCLK_N),
        .DVI_XCLK_P(                DVI_XCLK_P),
        .I2C_SCL_DVI(               IIC_SCL_VIDEO),
        .I2C_SDA_DVI(               IIC_SDA_VIDEO),
   /* Ready/Valid interface for 24-bit pixel values */
        .Video(                     video),
        .VideoReady(                video_ready),
        .VideoValid(                video_valid)
  );
  
   wire rst;
	assign rst = ~proc_sys_reset_0_Interconnect_aresetn_pin;
	wire [31:0] in;
	assign in = readbgcop_0_OUTBG_Port_pin;
   wire [35:0] chipscope_control;
    chipscope_icon icon(
    .CONTROL0(chipscope_control)
    ) /* synthesis syn_noprune = 1 */;
    chipscope_ila ila(
    .CONTROL(chipscope_control),
    .CLK(clockgoing_pin),
    .DATA({rst, clockgoing_pin,clock_generator_0_CLKOUT4_pin , 21'b0, count, bg_full, bg_valid, in}),
    .TRIG0(rst)
    ) /* synthesis syn_noprune = 1 */;


endmodule

