library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_fsm is
end tb_fsm;

architecture Behavioral of tb_fsm is
    component fsm is
        port(
            rst,clk,A,UP_LMT,DW_LMT: in std_logic;
            MOT_UP,MOT_DW: out std_logic
        );
    end component fsm;
    
    signal clk_s,rst_s,A_s,UP_LMT_s,DW_LMT_s,MOT_UP_s,MOT_DW_s: std_logic;
    constant clkper: time := 10 ns;
begin
    
    dut: fsm port map(clk=>clk_s,rst=>rst_s,A=>A_s,UP_LMT=>UP_LMT_s,DW_LMT=>DW_LMT_s,MOT_UP=>MOT_UP_s,MOT_DW=>MOT_DW_s);
    
    process
    begin
        clk_s<='0';
        wait for clkper/2;
        clk_s<='1';
        wait for clkper/2;
    end process;
    
    process
    begin
        rst_s<='1';
        wait for clkper/4;
        rst_s<='0'; UP_LMT_s<='1'; A_s<='1'; DW_LMT_s<='0';
        wait for clkper; UP_LMT_s<='0'; A_s<='0';
        wait for clkper;
        wait for clkper; DW_LMT_s<='1';
        wait for clkper; DW_LMT_s<='0';
        wait for clkper;
        wait for clkper;
        A_s<='1'; UP_LMT_s<='1';
        wait for clkper;
        A_s<='1'; UP_LMT_s<='0';
        wait for clkper; A_s<='0';
        wait for clkper; UP_LMT_s<='1';
        wait for clkper; UP_LMT_s<='0';
        A_s<='1';
        wait for clkper;
        wait for clkper;
        wait;
    end process;

end Behavioral;
