	component fifo_256x128 is
		port (
			data    : in  std_logic_vector(127 downto 0) := (others => 'X'); -- datain
			wrreq   : in  std_logic                      := 'X';             -- wrreq
			rdreq   : in  std_logic                      := 'X';             -- rdreq(ack)
			wrclk   : in  std_logic                      := 'X';             -- wrclk
			rdclk   : in  std_logic                      := 'X';             -- rdclk
			q       : out std_logic_vector(511 downto 0);                    -- dataout
			rdusedw : out std_logic_vector(5 downto 0);                      -- rdusedw
			wrusedw : out std_logic_vector(7 downto 0);                      -- wrusedw
			rdempty : out std_logic;                                         -- rdempty
			wrfull  : out std_logic                                          -- wrfull
		);
	end component fifo_256x128;

	u0 : component fifo_256x128
		port map (
			data    => CONNECTED_TO_data,    --  fifo_input.datain
			wrreq   => CONNECTED_TO_wrreq,   --            .wrreq
			rdreq   => CONNECTED_TO_rdreq,   --            .rdreq(ack)
			wrclk   => CONNECTED_TO_wrclk,   --            .wrclk
			rdclk   => CONNECTED_TO_rdclk,   --            .rdclk
			q       => CONNECTED_TO_q,       -- fifo_output.dataout
			rdusedw => CONNECTED_TO_rdusedw, --            .rdusedw
			wrusedw => CONNECTED_TO_wrusedw, --            .wrusedw
			rdempty => CONNECTED_TO_rdempty, --            .rdempty
			wrfull  => CONNECTED_TO_wrfull   --            .wrfull
		);

