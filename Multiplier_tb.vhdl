entity multiplier_tb is
end multiplier_tb;

architecture Behavioral of multiplier_tb is
  component multiplier
    port (a,b: in bit_vector (3 downto 0);
    z: out bit_vector(7 downto 0));
  end component;

  for multiplier_0: multiplier use entity work.multiplier;

  signal a,b: bit_vector(3 downto 0);
  signal z: bit_vector (7 downto 0);

  begin
    multiplier_0: multiplier port map (a, b, z);

    process
      begin
      --Case 1
      a <= "0000";
      b <= "0000";
      wait for 10 ns;
      assert (z = "00000000") report "Test ended" severity error;
      wait for 40 ns;
      --Case 2
      a <= "0001";
      b <= "0000";
      wait for 10 ns;
      assert (z= "00000000") report "Test ended" severity error;
      wait for 40 ns;
      --Case 3
      a <= "0001";
      b <= "0001";
      wait for 10 ns;
      assert (z= "00000001") report "Test ended correctly" severity error;
      wait for 40 ns;
      --Case 4
      a <= "0010";
      b <= "0000";
      wait for 10 ns;
      assert (z= "00000000") report "Test ended correctly" severity error;
      wait for 40 ns;
      --Case 5
      a <= "0010";
      b <= "0010";
      wait for 10 ns;
      assert (z= "00000010") report "Test ended correctly" severity error;
      wait for 40 ns;
    assert false report "end of test" severity note;
    wait;
  end process;


end Behavioral;
