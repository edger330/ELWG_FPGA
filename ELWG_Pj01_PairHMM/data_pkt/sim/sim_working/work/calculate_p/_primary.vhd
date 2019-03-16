library verilog;
use verilog.vl_types.all;
entity calculate_p is
    generic(
        D               : integer := 2;
        BASE_ADDR0      : vl_logic_vector(0 to 8) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        BASE_ADDR1      : vl_logic_vector(0 to 8) := (Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        BASE_ADDR2      : vl_logic_vector(0 to 8) := (Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        sys_clk         : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        start           : in     vl_logic;
        q_data          : in     vl_logic_vector(7 downto 0);
        i_data          : in     vl_logic_vector(7 downto 0);
        d_data          : in     vl_logic_vector(7 downto 0);
        c_data          : in     vl_logic_vector(7 downto 0);
        done            : out    vl_logic;
        p0              : out    vl_logic_vector(31 downto 0);
        p1              : out    vl_logic_vector(31 downto 0);
        p2              : out    vl_logic_vector(31 downto 0);
        p3              : out    vl_logic_vector(31 downto 0);
        p4              : out    vl_logic_vector(31 downto 0);
        p5              : out    vl_logic_vector(31 downto 0);
        p6              : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of D : constant is 1;
    attribute mti_svvh_generic_type of BASE_ADDR0 : constant is 1;
    attribute mti_svvh_generic_type of BASE_ADDR1 : constant is 1;
    attribute mti_svvh_generic_type of BASE_ADDR2 : constant is 1;
end calculate_p;
