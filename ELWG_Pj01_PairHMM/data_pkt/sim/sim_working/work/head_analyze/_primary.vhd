library verilog;
use verilog.vl_types.all;
entity head_analyze is
    generic(
        D               : integer := 2
    );
    port(
        sys_clk         : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        start           : in     vl_logic;
        cpu_pkt_ram_rdat: in     vl_logic_vector(7 downto 0);
        head_ram_ren    : in     vl_logic;
        head_ram_raddr  : in     vl_logic_vector(2 downto 0);
        cpu_pkt_ram_raddr: out    vl_logic_vector(17 downto 0);
        cpu_pkt_ram_ren : out    vl_logic;
        head_data       : out    vl_logic_vector(31 downto 0);
        done            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of D : constant is 1;
end head_analyze;
