	component ram_2048x512_8192x128 is
		port (
			data      : in  std_logic_vector(511 downto 0) := (others => 'X'); -- datain
			wraddress : in  std_logic_vector(10 downto 0)  := (others => 'X'); -- wraddress
			rdaddress : in  std_logic_vector(12 downto 0)  := (others => 'X'); -- rdaddress
			wren      : in  std_logic                      := 'X';             -- wren
			wrclock   : in  std_logic                      := 'X';             -- wrclock
			rdclock   : in  std_logic                      := 'X';             -- rdclock
			rden      : in  std_logic                      := 'X';             -- rden
			q         : out std_logic_vector(127 downto 0)                     -- dataout
		);
	end component ram_2048x512_8192x128;

	u0 : component ram_2048x512_8192x128
		port map (
			data      => CONNECTED_TO_data,      --  ram_input.datain
			wraddress => CONNECTED_TO_wraddress, --           .wraddress
			rdaddress => CONNECTED_TO_rdaddress, --           .rdaddress
			wren      => CONNECTED_TO_wren,      --           .wren
			wrclock   => CONNECTED_TO_wrclock,   --           .wrclock
			rdclock   => CONNECTED_TO_rdclock,   --           .rdclock
			rden      => CONNECTED_TO_rden,      --           .rden
			q         => CONNECTED_TO_q          -- ram_output.dataout
		);

