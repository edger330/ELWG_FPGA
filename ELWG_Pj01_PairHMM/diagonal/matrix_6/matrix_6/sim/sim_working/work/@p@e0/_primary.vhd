library verilog;
use verilog.vl_types.all;
entity PE0 is
    generic(
        FLOAT_C_0       : integer := 1063675494;
        FLOAT_C_1       : integer := 1036831948
    );
    port(
        sys_clk         : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        M_i_j           : in     vl_logic_vector(31 downto 0);
        X_i_j           : in     vl_logic_vector(31 downto 0);
        Y_i_j           : in     vl_logic_vector(31 downto 0);
        p_mx            : in     vl_logic_vector(31 downto 0);
        p_my            : in     vl_logic_vector(31 downto 0);
        p_mm            : in     vl_logic_vector(31 downto 0);
        lambda1         : in     vl_logic_vector(31 downto 0);
        lambda2         : in     vl_logic_vector(31 downto 0);
        H_in            : in     vl_logic_vector(7 downto 0);
        R_in            : in     vl_logic_vector(7 downto 0);
        Init_in         : in     vl_logic;
        Y_Init          : in     vl_logic_vector(31 downto 0);
        SUM_valid       : in     vl_logic;
        SUM_start       : in     vl_logic;
        SUM_start_out   : out    vl_logic;
        mode            : in     vl_logic;
        M_out           : out    vl_logic_vector(31 downto 0);
        X_out           : out    vl_logic_vector(31 downto 0);
        Y_out           : out    vl_logic_vector(31 downto 0);
        Init_out        : out    vl_logic;
        SUM_out         : out    vl_logic_vector(31 downto 0);
        H_out           : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of FLOAT_C_0 : constant is 1;
    attribute mti_svvh_generic_type of FLOAT_C_1 : constant is 1;
end PE0;
