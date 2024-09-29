library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SUDCWORAM3SO_SN74LS697_testbench_v2 is
end SUDCWORAM3SO_SN74LS697_testbench_v2;
    -- 500
architecture Behavioral of SUDCWORAM3SO_SN74LS697_testbench_v2 is
    component SUDCWORAM3SO_SN74LS697 is
        Port ( not_G : in STD_LOGIC;
           not_CCLR : in STD_LOGIC;
           not_LOAD : in STD_LOGIC;
           not_ENP : in STD_LOGIC;
           not_ENT : in STD_LOGIC; 
           U : in STD_LOGIC;     
           RCK : in STD_LOGIC;
           CCK : in STD_LOGIC;                           
           R : in STD_LOGIC;
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
    signal not_CCLR : STD_LOGIC := '0'; -- +   
    signal not_LOAD : STD_LOGIC := '0'; -- +
    signal not_ENP : STD_LOGIC := '0';  -- +
    signal not_ENT : STD_LOGIC := '0';  -- +     
    signal U : STD_LOGIC := '0';
    signal RCK : STD_LOGIC := '1';
    signal CCK : STD_LOGIC := '1';
    signal R : STD_LOGIC := '1';    
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
    uut: SUDCWORAM3SO_SN74LS697
        port map (
            not_G => not_G,
            not_CCLR => not_CCLR,
            not_LOAD => not_LOAD,
            not_ENP => not_ENP,
            not_ENT => not_ENT,
            U => U,
            RCK => RCK,
            CCK => CCK,            
            R => R,
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
        RCK <= '0';
        wait for 50 ns;
        RCK <= '1';
        wait for 10 ns;
        RCK <= '0';
        wait for 150 ns;
        for inner_loop in 0 to 7 loop
            RCK <= '1';
            wait for 10 ns;
            RCK <= '0';
            wait for 10 ns;
        end loop;
        wait;
    end process RCK_process;

    CCK_process : process
    begin
        CCK <= '0';
        wait for 20 ns;
        while true loop
            CCK <= '1';
            wait for 10 ns;
            CCK <= '0';
            wait for 10 ns;
        end loop;
        wait;
    end process CCK_process;
    
    LOAD_process : process
    begin
        A <= '1';
        B <= '0';
        C <= '0';
        D <= '0';
        not_LOAD <= '1';
        wait for 30 ns;
        A <= '1';
        B <= '0';
        C <= '1';
        D <= '1';
        not_LOAD <= '0';
        wait for 20 ns;
        A <= '0';
        B <= '0';
        C <= '0';
        D <= '0';
        not_LOAD <= '1';
        wait;
    end process LOAD_process;
    
    G_process : process
    begin
        not_G <= '0';
        wait for 220 ns;
        not_G <= '1';
        wait for 40 ns;
        not_G <= '0';
        wait;
    end process G_process;
    
    U_process : process
    begin
        U <= '1';
        wait for 200 ns;
        U <= '0';
        wait;
    end process U_process;
    
    CCLR_process : process
    begin
        not_CCLR <= '1';
        wait for 10 ns;
        not_CCLR <= '0';
        wait for 20 ns;
        not_CCLR <= '1';
        wait;
    end process CCLR_process;
    
    
    ENP_ENT_process : process
    begin
        not_ENP <= '0';
        not_ENT <= '0';
        wait for 390 ns;
        not_ENP <= '1';
        wait for 20 ns;
        not_ENT <= '1';
        wait for 20 ns;
        not_ENP <= '0';
        wait;
    end process ENP_ENT_process;
    
    R_process : process
    begin
        R <= '0';
        wait for 170 ns;
        R <= '1';
        wait for 200 ns;
        R <= '0';
        wait;
    end process R_process;

end Behavioral;