	component fifo_M is
		port (
			data  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datain
			wrreq : in  std_logic                     := 'X';             -- wrreq
			rdreq : in  std_logic                     := 'X';             -- rdreq(ack)
			clock : in  std_logic                     := 'X';             -- clk
			aclr  : in  std_logic                     := 'X';             -- aclr
			q     : out std_logic_vector(31 downto 0);                    -- dataout
			usedw : out std_logic_vector(11 downto 0)                     -- usedw
		);
	end component fifo_M;

	u0 : component fifo_M
		port map (
			data  => CONNECTED_TO_data,  --  fifo_input.datain
			wrreq => CONNECTED_TO_wrreq, --            .wrreq
			rdreq => CONNECTED_TO_rdreq, --            .rdreq(ack)
			clock => CONNECTED_TO_clock, --            .clk
			aclr  => CONNECTED_TO_aclr,  --            .aclr
			q     => CONNECTED_TO_q,     -- fifo_output.dataout
			usedw => CONNECTED_TO_usedw  --            .usedw
		);

