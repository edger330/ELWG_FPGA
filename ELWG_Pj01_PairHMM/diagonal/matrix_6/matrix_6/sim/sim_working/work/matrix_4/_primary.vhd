library verilog;
use verilog.vl_types.all;
entity matrix_4 is
    generic(
        MAX_DATA_NUM    : integer := 10240;
        MAX_TIME_OUT    : integer := 30000000;
        ADDR_MOVE       : vl_logic_vector(0 to 13) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        MAX_ADDR        : vl_logic_vector(0 to 7) := (Hi0, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0, Hi1);
        S0              : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        S1              : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        S2              : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        S3              : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        S4              : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0);
        S5              : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0);
        S6              : vl_logic_vector(0 to 7) := (Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        S7              : vl_logic_vector(0 to 7) := (Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        sys_clk         : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        matrix_memory_sop: in     vl_logic;
        matrix_memory_eop: in     vl_logic;
        matrix_memory_vld: in     vl_logic;
        matrix_memory_data: in     vl_logic_vector(31 downto 0);
        result_fifo_rden: in     vl_logic;
        pkt_receive_enable: out    vl_logic;
        result_fifo_rdat: out    vl_logic_vector(127 downto 0);
        result_fifo_empty: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of MAX_DATA_NUM : constant is 1;
    attribute mti_svvh_generic_type of MAX_TIME_OUT : constant is 1;
    attribute mti_svvh_generic_type of ADDR_MOVE : constant is 1;
    attribute mti_svvh_generic_type of MAX_ADDR : constant is 1;
    attribute mti_svvh_generic_type of S0 : constant is 1;
    attribute mti_svvh_generic_type of S1 : constant is 1;
    attribute mti_svvh_generic_type of S2 : constant is 1;
    attribute mti_svvh_generic_type of S3 : constant is 1;
    attribute mti_svvh_generic_type of S4 : constant is 1;
    attribute mti_svvh_generic_type of S5 : constant is 1;
    attribute mti_svvh_generic_type of S6 : constant is 1;
    attribute mti_svvh_generic_type of S7 : constant is 1;
end matrix_4;
