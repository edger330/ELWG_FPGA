	component afifo_8x1 is
		port (
			data    : in  std_logic                    := 'X'; -- datain
			wrreq   : in  std_logic                    := 'X'; -- wrreq
			rdreq   : in  std_logic                    := 'X'; -- rdreq
			wrclk   : in  std_logic                    := 'X'; -- wrclk
			rdclk   : in  std_logic                    := 'X'; -- rdclk
			q       : out std_logic;                           -- dataout
			wrusedw : out std_logic_vector(2 downto 0);        -- wrusedw
			rdempty : out std_logic;                           -- rdempty
			wrfull  : out std_logic                            -- wrfull
		);
	end component afifo_8x1;

	u0 : component afifo_8x1
		port map (
			data    => CONNECTED_TO_data,    --  fifo_input.datain
			wrreq   => CONNECTED_TO_wrreq,   --            .wrreq
			rdreq   => CONNECTED_TO_rdreq,   --            .rdreq
			wrclk   => CONNECTED_TO_wrclk,   --            .wrclk
			rdclk   => CONNECTED_TO_rdclk,   --            .rdclk
			q       => CONNECTED_TO_q,       -- fifo_output.dataout
			wrusedw => CONNECTED_TO_wrusedw, --            .wrusedw
			rdempty => CONNECTED_TO_rdempty, --            .rdempty
			wrfull  => CONNECTED_TO_wrfull   --            .wrfull
		);

