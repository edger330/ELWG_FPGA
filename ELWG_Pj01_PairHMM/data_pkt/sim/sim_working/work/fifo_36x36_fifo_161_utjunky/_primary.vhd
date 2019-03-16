library verilog;
use verilog.vl_types.all;
entity fifo_36x36_fifo_161_utjunky is
    port(
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(36 downto 0);
        rdreq           : in     vl_logic;
        wrreq           : in     vl_logic;
        empty           : out    vl_logic;
        full            : out    vl_logic;
        q               : out    vl_logic_vector(36 downto 0);
        usedw           : out    vl_logic_vector(4 downto 0)
    );
end fifo_36x36_fifo_161_utjunky;
