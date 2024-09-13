library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_trigger is
    Port (
        not_S : in STD_LOGIC;  -- ���� S (Set)
        not_R : in STD_LOGIC;  -- ���� R (Reset)
        J : in STD_LOGIC;      -- ���� J
        C : in STD_LOGIC;      -- �������� ������ (Clock)
        K : in STD_LOGIC;      -- ���� K
        Q : out STD_LOGIC;     -- ����� Q
        not_Q : out STD_LOGIC      -- ����� �� Q
    );
end JK_trigger;

architecture Behavioral of JK_trigger is
    signal Q_int : STD_LOGIC := '0';  -- ���������� ������ ��� �������� ���������
begin
    process(C, not_R)
    begin
        if not_R = '0' then
            Q_int <= '0';  -- ����� ���������
        elsif not_S = '0' then
            Q_int <= '1';  -- ��������� � 1
        elsif rising_edge(C) then       -- ��� ������� �������
            if J = '1' and K = '0' then
                Q_int <= '1';  -- ��������� � 1
            elsif J = '0' and K = '1' then
                Q_int <= '0';  -- ��������� � 0
            elsif J = '1' and K = '1' then
                Q_int <= not Q_int;  -- ������������ ���������
            end if;
        end if;
    end process;

    Q <= Q_int;  -- ����� Q
    not_Q <= not Q_int;  -- ����� �� Q
end Behavioral;