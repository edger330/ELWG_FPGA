library verilog;
use verilog.vl_types.all;
entity calculate_model is
    generic(
        D               : real    := 0.200000
    );
    port(
        p_mx            : in     vl_logic_vector(31 downto 0);
        p_my            : in     vl_logic_vector(31 downto 0);
        p_xx_yy         : in     vl_logic_vector(31 downto 0);
        p_xm_ym         : in     vl_logic_vector(31 downto 0);
        p_mm            : in     vl_logic_vector(31 downto 0);
        counter_out_ready_ok: in     vl_logic_vector(3 downto 0);
        counter_row_scan1: in     vl_logic_vector(8 downto 0);
        counter_col_scan1: in     vl_logic_vector(6 downto 0);
        sys_clk         : in     vl_logic;
        sys_rst         : in     vl_logic;
        m_i1_j1         : in     vl_logic_vector(31 downto 0);
        m_i1_j          : in     vl_logic_vector(31 downto 0);
        x_i1_j1         : in     vl_logic_vector(31 downto 0);
        x_i1_j          : in     vl_logic_vector(31 downto 0);
        y_i1_j1         : in     vl_logic_vector(31 downto 0);
        read_len_ok     : in     vl_logic_vector(7 downto 0);
        counter_sum     : in     vl_logic_vector(8 downto 0);
        en_counter_sum  : in     vl_logic;
        symbol          : in     vl_logic_vector(4 downto 0);
        hap_len         : in     vl_logic_vector(15 downto 0);
        m_i_j           : out    vl_logic_vector(31 downto 0);
        x_i_j           : out    vl_logic_vector(31 downto 0);
        y_i_j           : out    vl_logic_vector(31 downto 0);
        result          : out    vl_logic_vector(36 downto 0);
        result_vld      : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of D : constant is 1;
end calculate_model;
