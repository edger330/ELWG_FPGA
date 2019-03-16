library verilog;
use verilog.vl_types.all;
entity hap_analyze is
    generic(
        D               : integer := 2;
        IDLE            : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        GET_HAP_LEN     : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        COUNT_ONE_HAP   : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        WAIT_SAVING_0   : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        GET_HAP         : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0);
        WAIT_SAVING_1   : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0);
        \DONE\          : vl_logic_vector(0 to 7) := (Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        sys_clk         : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        start           : in     vl_logic;
        cpu_pkt_ram_rdat: in     vl_logic_vector(7 downto 0);
        hap_ram_ren     : in     vl_logic;
        hap_ram_raddr   : in     vl_logic_vector(16 downto 0);
        cpu_pkt_ram_raddr: out    vl_logic_vector(17 downto 0);
        cpu_pkt_ram_ren : out    vl_logic;
        hap_num         : out    vl_logic_vector(15 downto 0);
        hap_data        : out    vl_logic_vector(7 downto 0);
        done            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of D : constant is 1;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of GET_HAP_LEN : constant is 1;
    attribute mti_svvh_generic_type of COUNT_ONE_HAP : constant is 1;
    attribute mti_svvh_generic_type of WAIT_SAVING_0 : constant is 1;
    attribute mti_svvh_generic_type of GET_HAP : constant is 1;
    attribute mti_svvh_generic_type of WAIT_SAVING_1 : constant is 1;
    attribute mti_svvh_generic_type of \DONE\ : constant is 1;
end hap_analyze;
