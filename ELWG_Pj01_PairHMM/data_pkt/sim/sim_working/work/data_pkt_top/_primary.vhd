library verilog;
use verilog.vl_types.all;
entity data_pkt_top is
    generic(
        D               : integer := 2;
        IDLE            : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        GET_HEAD        : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        GET_HAP         : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        GET_READ        : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        SEND_PKT        : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0);
        DONE            : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        sys_clk         : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        matrix_enable   : in     vl_logic;
        cpu_pkt_done    : in     vl_logic;
        eop             : out    vl_logic;
        sop             : out    vl_logic;
        data            : out    vl_logic_vector(31 downto 0);
        vld             : out    vl_logic;
        data_done       : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of D : constant is 1;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of GET_HEAD : constant is 1;
    attribute mti_svvh_generic_type of GET_HAP : constant is 1;
    attribute mti_svvh_generic_type of GET_READ : constant is 1;
    attribute mti_svvh_generic_type of SEND_PKT : constant is 1;
    attribute mti_svvh_generic_type of DONE : constant is 1;
end data_pkt_top;
