library verilog;
use verilog.vl_types.all;
entity pair_hmm_top is
    port(
        sys_clk         : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        cpu_pkt_done    : in     vl_logic;
        read_done       : in     vl_logic;
        data_write_pcie : out    vl_logic_vector(127 downto 0);
        addr_write_pcie : out    vl_logic_vector(13 downto 0);
        en_write_pcie   : out    vl_logic;
        max_data_num_done: out    vl_logic;
        data_done       : out    vl_logic
    );
end pair_hmm_top;
