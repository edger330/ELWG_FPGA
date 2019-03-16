library verilog;
use verilog.vl_types.all;
entity read_analyze is
    generic(
        D               : integer := 2;
        IDLE            : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        GET_READ_LEN    : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        COUNT_ONE_READ  : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        WAIT_SAVING_0   : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        GET_READ        : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0);
        WAIT_SAVING_1   : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0);
        GET_P           : vl_logic_vector(0 to 7) := (Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        JUDGE           : vl_logic_vector(0 to 7) := (Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        \DONE\          : vl_logic_vector(0 to 7) := (Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1)
    );
    port(
        sys_clk         : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        start           : in     vl_logic;
        cpu_pkt_ram_rdat: in     vl_logic_vector(7 downto 0);
        cpu_pkt_ram_raddr: out    vl_logic_vector(17 downto 0);
        cpu_pkt_ram_ren : out    vl_logic;
        read_ram_ren    : in     vl_logic;
        read_ram_raddr  : in     vl_logic_vector(12 downto 0);
        read_data       : out    vl_logic_vector(7 downto 0);
        read_num        : out    vl_logic_vector(15 downto 0);
        start_get_read_addr: in     vl_logic_vector(17 downto 0);
        p_ram_ren       : in     vl_logic;
        p_ram_addr      : in     vl_logic_vector(12 downto 0);
        p0_ram_rdat     : out    vl_logic_vector(31 downto 0);
        p1_ram_rdat     : out    vl_logic_vector(31 downto 0);
        p2_ram_rdat     : out    vl_logic_vector(31 downto 0);
        p3_ram_rdat     : out    vl_logic_vector(31 downto 0);
        p4_ram_rdat     : out    vl_logic_vector(31 downto 0);
        p5_ram_rdat     : out    vl_logic_vector(31 downto 0);
        p6_ram_rdat     : out    vl_logic_vector(31 downto 0);
        done            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of D : constant is 1;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of GET_READ_LEN : constant is 1;
    attribute mti_svvh_generic_type of COUNT_ONE_READ : constant is 1;
    attribute mti_svvh_generic_type of WAIT_SAVING_0 : constant is 1;
    attribute mti_svvh_generic_type of GET_READ : constant is 1;
    attribute mti_svvh_generic_type of WAIT_SAVING_1 : constant is 1;
    attribute mti_svvh_generic_type of GET_P : constant is 1;
    attribute mti_svvh_generic_type of JUDGE : constant is 1;
    attribute mti_svvh_generic_type of \DONE\ : constant is 1;
end read_analyze;
