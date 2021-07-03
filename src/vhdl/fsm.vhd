library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm is
    port(
        rst,clk,A,UP_LMT,DW_LMT: in std_logic;
        MOT_UP,MOT_DW: out std_logic
    );
end fsm;

architecture Moore of fsm is
    type StateType is (S_wait, S_raise, S_close);
    signal currState,nextState: stateType;
begin
    reg: process(clk,rst)
    begin
        if(rst='1') then
            currState<=S_wait;
        elsif (rising_edge(clk)) then
            currState<=nextState;
        end if;
    end process reg;
    
    comb: process(A,UP_LMT,DW_LMT,currState)
    begin
    MOT_UP<='0'; MOT_DW<='0';
        case currState is
            when S_wait =>  if(A='0') then
                                nextState<=S_wait;
                            elsif (UP_LMT='0') then
                                nextState<=S_raise;
                            else
                                nextState<=S_close;
                            end if;
            when S_raise=>  MOT_UP<='1';
                            if(UP_LMT='1') then
                                nextState<=S_wait;
                            elsif(A='1') then
                                nextState<=S_close;
                            else
                                nextState<=S_raise;
                            end if;
            when S_close=>  MOT_DW<='1';
                            if(DW_LMT='1') then
                                nextState<=S_wait;
                            elsif(A='1') then
                                nextState<=S_raise;
                            else
                                nextState<=S_close;
                            end if;
            when others=>   nextState<=S_wait;
        end case;
        
    end process comb;

end Moore;
