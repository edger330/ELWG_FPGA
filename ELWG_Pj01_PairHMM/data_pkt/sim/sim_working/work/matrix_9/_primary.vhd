library verilog;
use verilog.vl_types.all;
entity matrix_9 is
    generic(
        D               : integer := 2;
        MAX_DATA_NUM    : integer := 9
    );
    port(
        matrix_memory_sop: in     vl_logic;
        matrix_memory_eop: in     vl_logic;
        matrix_memory_vld: in     vl_logic;
        matrix_memory_data: in     vl_logic_vector(31 downto 0);
        sys_clk         : in     vl_logic;
        sys_rst         : in     vl_logic;
        read_done       : in     vl_logic;
        enable          : out    vl_logic;
        data_write_pcie : out    vl_logic_vector(127 downto 0);
        addr_write_pcie : out    vl_logic_vector(13 downto 0);
        en_write_pcie   : out    vl_logic;
        max_data_num_done: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of D : constant is 1;
    attribute mti_svvh_generic_type of MAX_DATA_NUM : constant is 1;
end matrix_9;
