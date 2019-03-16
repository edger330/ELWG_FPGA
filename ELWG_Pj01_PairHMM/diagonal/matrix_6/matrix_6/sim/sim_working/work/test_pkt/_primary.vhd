library verilog;
use verilog.vl_types.all;
entity test_pkt is
    generic(
        D               : integer := 0;
        IDLE            : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        GET_PKT_NUM     : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        WAIT_ENABLE     : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        GET_DATA_NUM    : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        GET_DATA        : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0);
        JUDGE           : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0);
        DONE            : vl_logic_vector(0 to 7) := (Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        sys_clk         : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        matrix_enable   : in     vl_logic;
        pcie_write_done : in     vl_logic;
        pcie_ram_rdat   : in     vl_logic_vector(31 downto 0);
        get_data_done   : out    vl_logic;
        pcie_ram_ren    : out    vl_logic;
        pcie_ram_raddr  : out    vl_logic_vector(15 downto 0);
        pkt_data        : out    vl_logic_vector(31 downto 0);
        pkt_sop         : out    vl_logic;
        pkt_eop         : out    vl_logic;
        pkt_vld         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of D : constant is 1;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of GET_PKT_NUM : constant is 1;
    attribute mti_svvh_generic_type of WAIT_ENABLE : constant is 1;
    attribute mti_svvh_generic_type of GET_DATA_NUM : constant is 1;
    attribute mti_svvh_generic_type of GET_DATA : constant is 1;
    attribute mti_svvh_generic_type of JUDGE : constant is 1;
    attribute mti_svvh_generic_type of DONE : constant is 1;
end test_pkt;
