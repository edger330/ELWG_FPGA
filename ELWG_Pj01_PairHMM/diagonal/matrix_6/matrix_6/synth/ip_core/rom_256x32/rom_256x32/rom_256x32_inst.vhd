	component rom_256x32 is
		port (
			address : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			clock   : in  std_logic                     := 'X';             -- clk
			rden    : in  std_logic                     := 'X';             -- rden
			q       : out std_logic_vector(35 downto 0)                     -- dataout
		);
	end component rom_256x32;

	u0 : component rom_256x32
		port map (
			address => CONNECTED_TO_address, --  rom_input.address
			clock   => CONNECTED_TO_clock,   --           .clk
			rden    => CONNECTED_TO_rden,    --           .rden
			q       => CONNECTED_TO_q        -- rom_output.dataout
		);

