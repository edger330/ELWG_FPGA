library verilog;
use verilog.vl_types.all;
entity package_send is
    port(
        start           : in     vl_logic;
        sys_clk         : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        hap_num         : in     vl_logic_vector(15 downto 0);
        read_num        : in     vl_logic_vector(15 downto 0);
        hap_data        : in     vl_logic_vector(7 downto 0);
        head_data       : in     vl_logic_vector(31 downto 0);
        read_data       : in     vl_logic_vector(7 downto 0);
        p0_ram_rdat     : in     vl_logic_vector(31 downto 0);
        p1_ram_rdat     : in     vl_logic_vector(31 downto 0);
        p2_ram_rdat     : in     vl_logic_vector(31 downto 0);
        p3_ram_rdat     : in     vl_logic_vector(31 downto 0);
        p4_ram_rdat     : in     vl_logic_vector(31 downto 0);
        p5_ram_rdat     : in     vl_logic_vector(31 downto 0);
        p6_ram_rdat     : in     vl_logic_vector(31 downto 0);
        matrix_enable   : in     vl_logic;
        data            : out    vl_logic_vector(31 downto 0);
        sop             : out    vl_logic;
        eop             : out    vl_logic;
        vld             : out    vl_logic;
        hap_ram_ren     : out    vl_logic;
        hap_ram_raddr   : out    vl_logic_vector(16 downto 0);
        head_ram_ren    : out    vl_logic;
        head_ram_raddr  : out    vl_logic_vector(2 downto 0);
        read_ram_ren    : out    vl_logic;
        read_ram_raddr  : out    vl_logic_vector(12 downto 0);
        p_ram_raddr     : out    vl_logic_vector(12 downto 0);
        p_ram_ren       : out    vl_logic;
        all_finished    : out    vl_logic
    );
end package_send;
