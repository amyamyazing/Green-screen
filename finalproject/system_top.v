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
    readfgcop_0_OUTFG_Port_pin,
    readbgcop_0_OUTBG_Port_pin,
    clock_generator_0_CLKOUT4_pin,
    clock_generator_0_CLKOUT5_pin,
    clock_generator_0_CLKOUT6_pin,
    readbgcop_0_system_dcm_locked_pin,
    readbgcop_0_FSL_M_Write_pin,
    readfgcop_0_FSL_M_Write_pin,
    readfgcop_0_FSL_S_Read_pin,
    readbgcop_0_FSL_S_Read_pin,
    readbgcop_0_XIL_NPI_Addr_pin,
    readfgcop_0_XIL_NPI_Addr_pin,
	 //user added ports
	 GPIO_SW_C,
    GPIO_SW_S,
    GPIO_LED,
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
  output [0:31] readfgcop_0_OUTFG_Port_pin;
  output [0:31] readbgcop_0_OUTBG_Port_pin;
  output clock_generator_0_CLKOUT4_pin;
  output clock_generator_0_CLKOUT5_pin;
  output clock_generator_0_CLKOUT6_pin;
  output readbgcop_0_system_dcm_locked_pin;
  output readbgcop_0_FSL_M_Write_pin;
  output readfgcop_0_FSL_M_Write_pin;
  output readfgcop_0_FSL_S_Read_pin;
  output readbgcop_0_FSL_S_Read_pin;
  output [31:0] readbgcop_0_XIL_NPI_Addr_pin;
  output [31:0] readfgcop_0_XIL_NPI_Addr_pin;
  //user ports
  input        GPIO_SW_C;
  input        GPIO_SW_S;
  output [7:0] GPIO_LED;
  output [11:0] DVI_D;
  output        DVI_DE;
  output        DVI_H;
  output        DVI_RESET_B;
  output        DVI_V;
  output        DVI_XCLK_N;
  output        DVI_XCLK_P;
  
  inout         IIC_SCL_VIDEO;
  inout         IIC_SDA_VIDEO;
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
      .readfgcop_0_OUTFG_Port_pin ( readfgcop_0_OUTFG_Port_pin ),
      .readbgcop_0_OUTBG_Port_pin ( readbgcop_0_OUTBG_Port_pin ),
      .clock_generator_0_CLKOUT4_pin ( clock_generator_0_CLKOUT4_pin ),
      .clock_generator_0_CLKOUT5_pin ( clock_generator_0_CLKOUT5_pin ),
      .clock_generator_0_CLKOUT6_pin ( clock_generator_0_CLKOUT6_pin ),
      .readbgcop_0_system_dcm_locked_pin ( readbgcop_0_system_dcm_locked_pin ),
      .readbgcop_0_FSL_M_Write_pin ( readbgcop_0_FSL_M_Write_pin ),
      .readfgcop_0_FSL_M_Write_pin ( readfgcop_0_FSL_M_Write_pin ),
      .readfgcop_0_FSL_S_Read_pin ( readfgcop_0_FSL_S_Read_pin ),
      .readbgcop_0_FSL_S_Read_pin ( readbgcop_0_FSL_S_Read_pin ),
      .readbgcop_0_XIL_NPI_Addr_pin ( readbgcop_0_XIL_NPI_Addr_pin ),
      .readfgcop_0_XIL_NPI_Addr_pin ( readfgcop_0_XIL_NPI_Addr_pin )
    );

  wire [0 : 31] infg, inbg; 
  wire [31 : 0] addrbg, addrfg;
  reg [1 : 0] count, count2, count3; //counters to buffer up 4 pixels for fifo write width of 128 bits
  wire rst; 
  wire clk; //62.5MHz
  wire clk50; //50MHz
  wire chipclk; //200MHz
  wire validbg, validfg; 
  wire fslrdbg, fslrdfg;
  wire buffbg, bufffg; //1 when bg_dout and fg_dout have 4 pixels from DRAM
  wire buffered_bg, buffered_fg; //1 when buffbg/bufffg high and fifo not full
  wire [127 : 0] bg_din, fg_din, rdf_dout; //data to be written to fifo
  wire [23 : 0] bg_in, fg_in; //input to greenscreen
  wire [31 : 0] bg_dout, fg_dout; //data coming out of fifos
  wire [23 : 0] res;
  wire         pixel_rdf_rd_en;
  wire         pixel_af_wr_en;
  wire [30:0]  pixel_af_addr_din;
  wire         pixel_af_full;
  wire         pixel_rdf_valid;
  wire         video_ready;
  wire         dvi_video_ready;
  wire         video_valid;
  wire [23:0]  video;

  wire bg_full, fg_full, fg_ready, bg_ready, fg_empty, bg_empty;
  
  assign bg_ready = ~bg_empty;
  assign fg_ready = ~fg_empty;
  
  assign rst = ~fpga_0_rst_1_sys_rst_pin;
  assign clk = clock_generator_0_CLKOUT4_pin;
  assign clk50 = clock_generator_0_CLKOUT5_pin;
  assign chipclk = clock_generator_0_CLKOUT6_pin;
  assign validbg = readbgcop_0_FSL_M_Write_pin;
  assign validfg = readfgcop_0_FSL_M_Write_pin;
  assign fslrdbg = readbgcop_0_FSL_S_Read_pin;
  assign fslrdfg = readfgcop_0_FSL_S_Read_pin;
 
//logic to get pixel from DRAM 
  assign inbg = (validbg) ? readbgcop_0_OUTBG_Port_pin : 32'b0;
  assign infg = (validfg) ? readfgcop_0_OUTFG_Port_pin : 32'b0;
  assign addrbg =  readbgcop_0_XIL_NPI_Addr_pin;  
  assign addrfg =  readfgcop_0_XIL_NPI_Addr_pin;
  
//buffers up 4 pixels for write to fifo width of 128
  buff bg_buff(
	.rst(rst), 
	.validInput(validbg),
	.pixel(inbg),
	.out(bg_din),
	.validOutput(buffbg)
	);

//buffers up 4 pixels for write to fifo width of 128	
  buff fg_buff(
	.rst(rst), 
	.validInput(validfg),
	.pixel(infg),
	.out(fg_din),
	.validOutput(bufffg)
	);
	
//write to fifo is data is valid and fifo not full
  assign buffered_bg = buffbg && ~bg_full; 
  assign buffered_fg = bufffg && ~fg_full;

  

      pixel_fifo bg_fifo(
    	.rst(rst),
    	.wr_clk(clk),
    	.rd_clk(clk),
    	.din(bg_din), //input
    	.wr_en(buffered_bg), //input
    	.rd_en(bg_ready),
    	.dout(bg_dout),
    	.full(bg_full),
    	.empty(bg_empty));
		
      pixel_fifo fg_fifo(
    	.rst(rst),
    	.wr_clk(clk),
    	.rd_clk(clk),
    	.din(fg_din), //input
    	.wr_en(buffered_fg), //input
    	.rd_en(fg_ready),
    	.dout(fg_dout),
    	.full(fg_full),
    	.empty(fg_empty));

//if fifo is not empty read from it and assign for passing into GreenScreen module
  assign bg_in = (bg_ready) ? bg_dout[23:0] : 24'b0;
  assign fg_in = (fg_ready) ? fg_dout[23:0] : 24'b0;

  GreenScreen gs(
    .bg(bg_in),
	 .fg(fg_in),
	 .Result(res));

  wire gs_valid;
  assign gs_valid = (res != 24'b0);
	 
//buffers up four processed pixels for pixelfeeder write width of 128	 
  buff gs_buff(
	.rst(rst), 
	.validInput(gs_valid),
	.pixel(res),
	.out(rdf_dout),
	.validOutput(pixel_rdf_valid)
	);
  
  //DVI
  
  
    PixelFeeder pixelfeed(
        .cpu_clk_g(clk50),
        .clk50_g(clk50),
        .rst(rst),
        .rdf_valid(pixel_rdf_valid),
        .af_full(pixel_af_full),
        .rdf_dout(rdf_dout),
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
    .Clock(                     clk50),
    .Reset(                     rst),
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


  assign GPIO_LED = 8'b10101011;
	  
  
  
	  wire [35:0] chipscope_control;
 chipscope_icon icon(
 .CONTROL0(chipscope_control)
 ) /* synthesis syn_noprune = 1 */;
 chipscope_ila ila(
 .CONTROL(chipscope_control),
 .CLK(clk),
 .DATA({10'b0 ,rst,fslrdbg,validbg,inbg,addrbg}), //tests that values are coming in from DRAM
 //.DATA({8'b0 ,rst,validbg,bg_ready,buffbg,buffered_bg,bg_din[63:0]}),
 //.DATA({16'b0, rst,count,inbg, video, video_ready, video_valid}),
 .TRIG0(rst)
 ) /* synthesis syn_noprune = 1 */; 


endmodule

