	component fifo_8x2_dis is
		port (
			data  : in  std_logic_vector(1 downto 0) := (others => 'X'); -- datain
			wrreq : in  std_logic                    := 'X';             -- wrreq
			rdreq : in  std_logic                    := 'X';             -- rdreq(ack)
			clock : in  std_logic                    := 'X';             -- clk
			q     : out std_logic_vector(1 downto 0);                    -- dataout
			usedw : out std_logic_vector(2 downto 0);                    -- usedw
			full  : out std_logic;                                       -- full
			empty : out std_logic                                        -- empty
		);
	end component fifo_8x2_dis;

	u0 : component fifo_8x2_dis
		port map (
			data  => CONNECTED_TO_data,  --  fifo_input.datain
			wrreq => CONNECTED_TO_wrreq, --            .wrreq
			rdreq => CONNECTED_TO_rdreq, --            .rdreq(ack)
			clock => CONNECTED_TO_clock, --            .clk
			q     => CONNECTED_TO_q,     -- fifo_output.dataout
			usedw => CONNECTED_TO_usedw, --            .usedw
			full  => CONNECTED_TO_full,  --            .full
			empty => CONNECTED_TO_empty  --            .empty
		);

