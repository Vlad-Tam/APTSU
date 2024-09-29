library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SUDCWORAM3SO_SN74LS697 is
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
           not_RCO : out STD_LOGIC
           );
end SUDCWORAM3SO_SN74LS697;

architecture Behavioral of SUDCWORAM3SO_SN74LS697 is
component JK_trigger is
    Port (
        not_S : in STD_LOGIC;
        not_R : in STD_LOGIC;
        J     : in STD_LOGIC;
        C     : in STD_LOGIC;
        K     : in STD_LOGIC;
        Q     : out STD_LOGIC;
        not_Q : out STD_LOGIC
    );
end component;
component JK_wrapper is
    Port (
        D       : in STD_LOGIC;
        not_C   : in STD_LOGIC;
        not_R   : in STD_LOGIC;
        Q       : out STD_LOGIC;
        not_Q   : out STD_LOGIC
    );
end component;
    

signal R0:      STD_LOGIC;
signal R1:      STD_LOGIC;
signal R2:      STD_LOGIC;
signal R3:      STD_LOGIC;
signal JK0:     STD_LOGIC;
signal JK1:     STD_LOGIC;
signal JK2:     STD_LOGIC;
signal JK3:     STD_LOGIC;
signal not_JK0: STD_LOGIC;
signal not_JK1: STD_LOGIC;
signal not_JK2: STD_LOGIC;
signal not_JK3: STD_LOGIC;
signal not_JK4: STD_LOGIC;
signal not_JK5: STD_LOGIC;
signal not_JK6: STD_LOGIC;
signal not_JK7: STD_LOGIC;
signal W:       STD_LOGIC;
signal LEE:     STD_LOGIC;
signal CTL0:    STD_LOGIC;
signal CTL1:    STD_LOGIC;
signal CTL2:    STD_LOGIC;
signal CTL3:    STD_LOGIC;
signal DV0:     STD_LOGIC;
signal DV1:     STD_LOGIC;
signal DV2:     STD_LOGIC;
signal DV3:     STD_LOGIC;
signal not_CCK: STD_LOGIC;
signal not_RCK: STD_LOGIC;
begin
    
   JK_inst0 : JK_wrapper
   port map (
       D => DV0,
       not_C => not_CCK,
       not_R => not_CCLR,
       Q => JK0,
       not_Q => not_JK0
   );
   
   JK_inst1 : JK_wrapper
   port map (
       D => DV1,
       not_C => not_CCK,
       not_R => not_CCLR,
       Q => JK1,
       not_Q => not_JK1
   );
   
   JK_inst2 : JK_wrapper
   port map (
       D => DV2,
       not_C => not_CCK,
       not_R => not_CCLR,
       Q => JK2,
       not_Q => not_JK2
   );

   JK_inst3 : JK_wrapper
   port map (
       D => DV3,
       not_C => not_CCK,
       not_R => not_CCLR,
       Q => JK3,
       not_Q => not_JK3
   );     
   
   JK_inst4 : JK_wrapper
   port map (
       D => DV0,
       not_C => not_RCK,
       not_R => '1',
       not_Q => not_JK4
   );
   
   JK_inst5 : JK_wrapper
   port map (
       D => DV1,
       not_C => not_RCK,
       not_R => '1',
       not_Q => not_JK5
   );
   
   JK_inst6 : JK_wrapper
   port map (
       D => DV2,
       not_C => not_RCK,
       not_R => '1',
       not_Q => not_JK6
   );

   JK_inst7 : JK_wrapper
   port map (
       D => DV3,
       not_C => not_RCK,
       not_R => '1',
       not_Q => not_JK7
   );
   
    not_CCK <= not CCK;
    not_RCK <= not RCK;
    LEE <= (not (not not_LOAD)) and (not not_ENP) and (not not_ENT);
    CTL0 <= not ((JK0 and (not U)) or ((not (not U)) and not_JK0));
    CTL1 <= not ((JK1 and (not U)) or ((not (not U)) and not_JK1));
    CTL2 <= not ((JK2 and (not U)) or ((not (not U)) and not_JK2));
    CTL3 <= not ((JK3 and (not U)) or ((not (not U)) and not_JK3));
    W <= not ((not (not_ENT)) and CTL0 and CTL1 and CTL2 and CTL3);
    DV0 <= not ((not (A or (not (not not_LOAD)))) or (JK0 and LEE) or ((not LEE) and (not (not not_LOAD)) and (not_JK0)));
    DV1 <= not ((not (B or (not (not not_LOAD)))) or (JK1 and LEE and CTL0) or (((not LEE) or (not CTL0)) and (not (not not_LOAD)) and (not_JK1)));
    DV2 <= not ((not (C or (not (not not_LOAD)))) or (JK2 and LEE and CTL0 and CTL1) or (((not LEE) or (not CTL0) or (not CTL1)) and (not (not not_LOAD)) and (not_JK2)));
    DV3 <= not ((not (D or (not (not not_LOAD)))) or (JK3 and LEE and CTL0 and CTL1 and CTL2) or (((not LEE) or (not CTL0) or (not CTL1) or (not CTL2)) and (not (not not_LOAD)) and (not_JK3)));
    
    R0 <= (not not_G) and (not (((not (not R)) and not_JK4) or ((not R) and (not_JK0))));
    R1 <= (not not_G) and (not (((not (not R)) and not_JK5) or ((not R) and (not_JK1))));
    R2 <= (not not_G) and (not (((not (not R)) and not_JK6) or ((not R) and (not_JK2))));
    R3 <= (not not_G) and (not (((not (not R)) and not_JK7) or ((not R) and (not_JK3))));
    
    
    Qa <= R0;
    Qb <= R1;
    Qc <= R2;
    Qd <= R3;
    not_RCO <= W;
end Behavioral;
