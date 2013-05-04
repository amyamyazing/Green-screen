

module GreenScreen (
  input   [23:0] bg,
  input   [23:0] fg,
  output  [23:0] Result
);
  wire [7:0] r_bg, g_bg, b_bg, r_fg, g_fg, b_fg, r_tar, g_tar, b_tar;
  wire [15:0] r_euc, g_euc, b_euc;
  wire [17:0] euc_sum;
  wire [35:0] euc_sq;
  wire [35:0] tol;
  assign   tol = 36'd900;
  assign   r_tar = 8'h00;
  assign   g_tar = 8'hff;
  assign   b_tar = 8'h00;
  assign   r_fg = fg[23:16];
  assign   g_fg = fg[15:8];
  assign   b_fg = fg[7:0];
  assign   r_euc = (r_tar - r_fg) * (r_tar - r_fg);
  assign   g_euc = (g_tar - g_fg) * (g_tar - g_fg);
  assign   b_euc = (b_tar - b_fg) * (b_tar - b_fg);
  assign   euc_sum = r_euc + g_euc + b_euc;
  assign   euc_sq = euc_sum * euc_sum;
  assign   Result = (euc_sq < tol) ? bg : fg;

endmodule
