`timescale 1ns / 1ps
`default_nettype none

module shift_and_scale #(
  parameter FRAME_WIDTH = 512,
  parameter FRAME_HEIGHT= 512
)(
  input wire [10:0] h_offset,
  input wire [9:0]  v_offset,
  input wire [10:0] hcount_in,
  input wire [9:0] vcount_in,
  output logic [10:0] shifted_hcount_out,
  output logic [9:0] shifted_vcount_out,
  output logic valid_addr_out
);
  always_comb begin
    valid_addr_out = hcount_in < FRAME_WIDTH && vcount_in < FRAME_HEIGHT;
    shifted_hcount_out = hcount_in + h_offset;
    shifted_vcount_out = vcount_in + v_offset;
  end
endmodule


`default_nettype wire

