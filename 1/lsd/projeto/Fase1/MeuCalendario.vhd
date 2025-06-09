library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity MeuCalendario is
	port(SW		  : in  std_logic_vector(0 downto 0);
		  CLOCK_50 : in  std_logic;
		  KEY		  : in  std_logic_vector(2 downto 0);
		  HEX0	  : out std_logic_vector(6 downto 0);
		  HEX1	  : out std_logic_vector(6 downto 0);
		  HEX2	  : out std_logic_vector(6 downto 0);
		  HEX3	  : out std_logic_vector(6 downto 0);
		  HEX4	  : out std_logic_vector(6 downto 0);
		  HEX5	  : out std_logic_vector(6 downto 0);
		  HEX6	  : out std_logic_vector(6 downto 0);
		  HEX7	  : out std_logic_vector(6 downto 0);
		  LEDG	  : out std_logic_vector(8 downto 0);
		  LEDR	  : out std_logic_vector(17 downto 0));
		  
end MeuCalendario;


architecture Structural of MeuCalendario is
	
	--Clocks
	signal tC, dC : std_logic;
	
	--Enables
	signal mesEnable, ano1Enable, ano2Enable, ano3Enable, ano4Enable : std_logic;
	
	--ValOut
	signal diaOut, mesOut : std_logic_vector(4 downto 0);
	signal ano1Out, ano2Out, ano3Out, ano4Out : std_logic_vector(3 downto 0);

	--Terms
	signal diaTerms, mesTerms, ano1Terms, ano2Terms, ano3Terms : std_logic;
	
	--Max day of month
	signal DayMonth : std_logic_vector(4 downto 0);
	
	--BCD Dez/Uni
	signal uniDiasBCD,  uniMesesBCD : std_logic_vector (3 downto 0);
	signal dezDiasBCD, dezMesesBCD : std_logic_vector (3 downto 0);
	
	--Display refresh
	signal MuxData : std_logic_vector (3 downto 0);
	signal MuxSelect : std_logic_vector (2 downto 0);
	signal DecoderOutput : std_logic_vector (6 downto 0);
	signal RegSelect : std_logic_vector (7 downto 0);

	
begin
	
	RegPulseGenerator   : entity work.RegPulseGenerator(Behavioral)
						port map(clk  => CLOCK_50,
									reset   => SW(0),
									timeClk  => tc,
									dispclk 	=> dc);
	
	DiasDoMes   : entity work.DiasDoMes(RTL)
						port map(clk  => CLOCK_50,
									input   => mesOut,
									valOut  => DayMonth
									);	
	
	CounterDosDias  : entity work.Counter5bits(RTL)
						port map(clk  => CLOCK_50,
									reset   => SW(0),
									MAX => DayMonth,
									enable1  => tc,
									valOut 	=> diaOut,
									termCnt => diaTerms);	

	mesEnable <= tc and diaTerms;
	CounterDosMeses  : entity work.Counter5Bits(RTL)
						port map(clk  => CLOCK_50,
									reset   => SW(0),
									enable1  => mesEnable,
									MAX => std_logic_vector(to_unsigned(12,5)),
									valOut 	=> mesOut,
									termCnt => mesTerms);
								
	ano1Enable <= tc and diaTerms and mesTerms;	
	CounterDosAnos1  : entity work.Counter4Bits(RTL)
						generic map (MAX => 9)
						port map(clk  => CLOCK_50,
									reset   => SW(0),
									enable1  => ano1Enable,
									valOut 	=> ano1Out,
									termCnt => ano1Terms);
	
	ano2Enable <= tc and diaTerms and mesTerms and ano1Terms;	
	CounterDosAnos2  : entity work.Counter4Bits(RTL)
							 generic map (MAX => 9)
							 port map(clk  => CLOCK_50,
									reset   	=> SW(0),
									enable1  => ano2Enable,
									valOut 	=> ano2Out,
									termCnt 	=> ano2Terms);
									
	ano3Enable <= tc and diaTerms and mesTerms and ano1Terms and ano2Terms;	
	CounterDosAnos3  : entity work.Counter4Bits(RTL)
							 generic map (MAX => 9)
							 port map(clk  	=> CLOCK_50,
									reset   	=> SW(0),
									enable1  => ano3Enable,
									valOut 	=> ano3Out,
									termCnt 	=> ano3Terms);
									
	ano4Enable <= tc and diaTerms and mesTerms and ano1Terms and ano2Terms and ano3Terms;	
	CounterDosAnos4  : entity work.Counter4Bits(RTL)
							 generic map (MAX => 9)
							 port map(clk  	=> CLOCK_50,
									reset   	=> SW(0),
									enable1	=> ano4Enable,
									valOut 	=> ano4Out,
									termCnt 	=> open);
	
	DiasBCD  : entity work.BCD(Behavioral)
						port map(input => diaOut,
									uni   => uniDiasBCD,
									dez  	=> dezDiasBCD);
									
	MesesBCD : entity work.BCD(Behavioral)
						port map(input => MesOut,
									uni   => uniMesesBCD,
									dez  	=> dezMesesBCD);
									
	Mux  		: entity work.Mux(Behavioral)
						generic map (size => 4)
						port map(sel	  => MuxSelect,
									dataIn0 => uniDiasBCD,
									dataIn1 => dezDiasBCD,
									dataIn2 => uniMesesBCD,
									dataIn3 => dezMesesBCD,
									dataIn4 => ano1Out,
									dataIn5 => ano2Out,
									dataIn6 => ano3Out,
									dataIn7 => ano4Out,
									dataOut => MuxData
									);
									
	Bin7SegDecoder	: entity work.Bin7SegDecoder(Behavioral)
						port map(binInput => MuxData,
									decOut_n => DecoderOutput);
	
	DispCntrl : entity work.DispCntrl(v9)
                            port map(clk         => CLOCK_50,
                                        reset    => SW(0),
                                        enable   => dc, 
                                        selMux   => MuxSelect, 
                                        selReg   => RegSelect);
	
	dispDias1 : entity work.Reg(Behavioral)
                            generic map (N => 7)
									 port map(reset     => SW(0),
                                        clk        => CLOCK_50,
                                        enable     => RegSelect(1), 
                                        dataIn     => DecoderOutput, 
                                        dataOut    => HEX7);
													 
	dispDias0 : entity work.Reg(Behavioral)
									 generic map (N => 7)
                            port map(reset     => SW(0),
                                        clk        => CLOCK_50,
                                        enable     => RegSelect(0), 
                                        dataIn     => DecoderOutput, 
                                        dataOut    => HEX6);
													 
	dispMes1 : entity work.Reg(Behavioral)
                            generic map (N => 7)
									 port map(reset     => SW(0),
                                        clk        => CLOCK_50,
                                        enable     => RegSelect(3), 
                                        dataIn     => DecoderOutput, 
                                        dataOut    => HEX5);
													 
	dispMes0 : entity work.Reg(Behavioral)
                            generic map (N => 7)
									 port map(reset     => SW(0),
                                        clk        => CLOCK_50,
                                        enable     => RegSelect(2), 
                                        dataIn     => DecoderOutput, 
                                        dataOut    => HEX4);
													 
	dispAnos0 : entity work.Reg(Behavioral)
                            generic map (N => 7)
									 port map(reset     => SW(0),
                                        clk        => CLOCK_50,
                                        enable     => RegSelect(4), 
                                        dataIn     => DecoderOutput, 
                                        dataOut    => HEX0);
													 
	dispAnos1 : entity work.Reg(Behavioral)
                            generic map (N => 7)
									 port map(reset     => SW(0),
                                        clk        => CLOCK_50,
                                        enable     => RegSelect(5), 
                                        dataIn     => DecoderOutput, 
                                        dataOut    => HEX1);
													 
	dispAnos2 : entity work.Reg(Behavioral)
                            generic map (N => 7)
									 port map(reset     => SW(0),
                                        clk        => CLOCK_50,
                                        enable     => RegSelect(6), 
                                        dataIn     => DecoderOutput, 
                                        dataOut    => HEX2);
													 
	dispAnos3 : entity work.Reg(Behavioral)
                            generic map (N => 7)
									 port map(reset     => SW(0),
                                        clk        => CLOCK_50,
                                        enable     => RegSelect(7), 
                                        dataIn     => DecoderOutput, 
                                        dataOut    => HEX3);
													 
end Structural;