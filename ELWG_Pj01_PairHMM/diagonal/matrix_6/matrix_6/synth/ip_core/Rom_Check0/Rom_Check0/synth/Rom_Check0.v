// Rom_Check0.v

// Generated using ACDS version 16.1 196

`timescale 1 ps / 1 ps
module Rom_Check0 (
		input  wire [7:0]  address, //  rom_input.address
		input  wire        clock,   //           .clk
		input  wire        rden,    //           .rden
		output wire [31:0] q        // rom_output.dataout
	);

	Rom_Check0_rom_1port_161_yfdjnlq rom_1port_0 (
		.address (address), //  rom_input.address
		.clock   (clock),   //           .clk
		.rden    (rden),    //           .rden
		.q       (q)        // rom_output.dataout
	);

endmodule
