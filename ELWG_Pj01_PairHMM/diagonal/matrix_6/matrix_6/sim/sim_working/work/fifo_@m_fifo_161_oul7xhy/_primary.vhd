library verilog;
use verilog.vl_types.all;
entity fifo_M_fifo_161_oul7xhy is
    port(
        aclr            : in     vl_logic;
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(31 downto 0);
        rdreq           : in     vl_logic;
        wrreq           : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0);
        usedw           : out    vl_logic_vector(8 downto 0)
    );
end fifo_M_fifo_161_oul7xhy;
