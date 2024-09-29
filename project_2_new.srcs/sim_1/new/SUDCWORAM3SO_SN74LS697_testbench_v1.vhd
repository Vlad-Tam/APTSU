library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SUDCWORAM3SO_SN74LS697_testbench_v1 is
end SUDCWORAM3SO_SN74LS697_testbench_v1;
-- 680360
architecture Behavioral of SUDCWORAM3SO_SN74LS697_testbench_v1 is
    component SUDCWORAM3SO_SN74LS697 is
        Port ( not_G : in STD_LOGIC;
               R : in STD_LOGIC;
               RCK : in STD_LOGIC;
               not_CCLR : in STD_LOGIC;
               U : in STD_LOGIC;
               not_LOAD : in STD_LOGIC;
               not_ENP : in STD_LOGIC;
               not_ENT : in STD_LOGIC;
               CCK : in STD_LOGIC;
               A : in STD_LOGIC;
               B : in STD_LOGIC;
               C : in STD_LOGIC;
               D : in STD_LOGIC;
               Qa : out STD_LOGIC;
               Qb : out STD_LOGIC;
               Qc : out STD_LOGIC;
               Qd : out STD_LOGIC;
               not_RCO : out STD_LOGIC);
    end component;

    -- Сигналы для подключения к компоненту
    signal not_G : STD_LOGIC := '1';
    signal R : STD_LOGIC := '1';
    signal RCK : STD_LOGIC := '1';
    signal not_CCLR : STD_LOGIC := '0'; -- +
    signal U : STD_LOGIC := '0';
    signal not_LOAD : STD_LOGIC := '0'; -- +
    signal not_ENP : STD_LOGIC := '0';  -- +
    signal not_ENT : STD_LOGIC := '0';  -- +
    signal CCK : STD_LOGIC := '1';
    signal A : STD_LOGIC := '0';
    signal B : STD_LOGIC := '0';
    signal C : STD_LOGIC := '0';
    signal D : STD_LOGIC := '0';
    signal Qa : STD_LOGIC;
    signal Qb : STD_LOGIC;
    signal Qc : STD_LOGIC;
    signal Qd : STD_LOGIC;
    signal not_RCO : STD_LOGIC;

begin
    -- Инстанциация счетчика
    uut: SUDCWORAM3SO_SN74LS697
        port map (
            not_G => not_G,
            R => R,
            RCK => RCK,
            not_CCLR => not_CCLR,
            U => U,
            not_LOAD => not_LOAD,
            not_ENP => not_ENP,
            not_ENT => not_ENT,
            CCK => CCK,
            A => A,
            B => B,
            C => C,
            D => D,
            Qa => Qa,
            Qb => Qb,
            Qc => Qc,
            Qd => Qd,
            not_RCO => not_RCO
        );

    RCK_process : process
    begin
        while true loop
            RCK <= '0';
            wait for 10 ns;
            RCK <= '1';
            wait for 10 ns;
        end loop;
    end process RCK_process;

CCK_process : process
    begin
        while true loop
            CCK <= '0';
            wait for 5 ns;
            CCK <= '1';
            wait for 5 ns;
        end loop;
    end process CCK_process;
    
    test_case: process  
      begin
          
          not_G <= '0';
          A <= '1';
          B <= '1';
          C <= '1';
          D <= '0';
          not_LOAD <= '1';
          not_ENP <= '1';
          not_ENT <= '1';
          not_CCLR <= '1';
          wait for 20 ns;
--          CHECK LOAD, A, B, C, D
          not_LOAD <= '0';
          wait for 20 ns;
          not_LOAD <= '1';
          wait for 60 ns;
--          CHECK ASYNC RESET
          not_CCLR <= '0';
          wait for 20 ns;
          not_CCLR <= '1';
          wait for 40 ns;
          B <= '0';
          wait for 20 ns;
          not_LOAD <= '0';
          wait for 20 ns;
          not_LOAD <= '1';
          wait for 40 ns;
--          CHECK DECREMENT
          not_ENP <= '0';
          not_ENT <= '0';
          R <= '0';
          wait for 200 ns;
--          CHECK INCREMENT
          U <= '1';
          wait for 140 ns;
          R <= '1';          
          not_ENP <= '1';
          not_ENT <= '1';
          wait for 300 ns;
          R <= '0';
          not_ENT <= '0';
          wait for 100 ns;
--          not_LOAD <= '0';
          wait for 40 ns;
--          not_ENP <= '0';
--          not_ENT <= '1';
--          wait for 100 ns;
--          not_ENP <= '0';
          
          
                      
--          R <= '0';
--          wait for 20 ns;
--          R <= '1';
--          wait for 100 ns;
          
          
          
          
          
          wait for 1000 ns;
--          not_G <= '1';
      
        for not_G_i in std_logic range '0' to '1' loop
            for R_i in std_logic range '0' to '1' loop
                for not_CCLR_i in std_logic range '0' to '1' loop
                    for not_LOAD_i in std_logic range '0' to '1' loop
                        for not_ENP_i in std_logic range '0' to '1' loop
                            for not_ENT_i in std_logic range '0' to '1' loop
                                for U_i in std_logic range '0' to '1' loop                                   
                                    for B_i in std_logic range '0' to '1' loop
                                        for C_i in std_logic range '0' to '1' loop
                                            for A_i in std_logic range '0' to '1' loop
                                                for D_i in std_logic range '0' to '1' loop
                                                    for inner_loop in 0 to 7 loop
                                                        not_G <= not_G_i;
                                                        R <= R_i;
                                                        not_CCLR <= not_CCLR_i;
                                                        U <= U_i;
                                                        not_LOAD <= not_LOAD_i;
                                                        not_ENP <= not_ENP_i;
                                                        not_ENT <= not_ENT_i;
                                                        A <= A_i;
                                                        B <= B_i;
                                                        C <= C_i;
                                                        D <= D_i;
                                                        wait for 10 ns;
                                                    end loop;
                                                end loop;
                                            end loop;
                                        end loop;
                                    end loop;
                                end loop;
                            end loop;
                        end loop;
                    end loop;
                end loop;
            end loop;
        end loop;
        
        wait;
    end process;
end Behavioral;