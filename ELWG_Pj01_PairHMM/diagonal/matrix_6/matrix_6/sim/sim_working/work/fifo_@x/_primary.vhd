library verilog;
use verilog.vl_types.all;
entity fifo_X is
    port(
        data            : in     vl_logic_vector(31 downto 0);
        wrreq           : in     vl_logic;
        rdreq           : in     vl_logic;
        clock           : in     vl_logic;
        aclr            : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0);
        usedw           : out    vl_logic_vector(11 downto 0)
    );
end fifo_X;
