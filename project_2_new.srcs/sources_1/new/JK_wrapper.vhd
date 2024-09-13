library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_wrapper is
    Port (
        not_R : in STD_LOGIC;  -- ���� R (Reset)
        not_C : in STD_LOGIC;  -- ���� C (Clock)
        D : in STD_LOGIC;      -- ���� D
        Q : out STD_LOGIC;     -- ����� Q
        not_Q : out STD_LOGIC   -- ����� �� Q
    );
end JK_wrapper;

architecture Behavioral of JK_wrapper is
    signal J : STD_LOGIC;
    signal K : STD_LOGIC;
    signal C : STD_LOGIC;
begin
    -- ����������� J � K ��� ������ ��� D-�������
    J <= D;  -- J ��������� �������� D
    K <= not D;  -- K ��������� ��������������� �������� D
    C <= not_C;  -- ����������� ������ ��� ������������� � JK-��������

    -- ������������ JK-�������
    JK_inst : entity work.JK_trigger
        port map (
            not_S => '1',  -- �� ���������� ���� S
            not_R => not_R,
            J => J,
            C => C,
            K => K,
            Q => Q,
            not_Q => not_Q
        );
end Behavioral;
