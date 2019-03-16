	component fp_add is
		port (
			a      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- a
			areset : in  std_logic                     := 'X';             -- reset
			b      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- b
			clk    : in  std_logic                     := 'X';             -- clk
			q      : out std_logic_vector(31 downto 0);                    -- q
			en     : in  std_logic_vector(0 downto 0)  := (others => 'X')  -- en
		);
	end component fp_add;

	u0 : component fp_add
		port map (
			a      => CONNECTED_TO_a,      --      a.a
			areset => CONNECTED_TO_areset, -- areset.reset
			b      => CONNECTED_TO_b,      --      b.b
			clk    => CONNECTED_TO_clk,    --    clk.clk
			q      => CONNECTED_TO_q,      --      q.q
			en     => CONNECTED_TO_en      --     en.en
		);

