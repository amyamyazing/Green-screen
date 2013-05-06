

module TestDevice (
  input   bg,
  input   fg,
  output  [23:0] Result
);
  

  assign   Result = bg == fg;

endmodule
