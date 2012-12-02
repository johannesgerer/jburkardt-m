function exact = p00_exact ( prob )

%*****************************************************************************80
%
%% P00_EXACT returns the exact integral for any problem.
%
%  Discussion:
%
%    This routine provides a "generic" interface to the exact integral
%    routines for the various problems, and allows a problem to be called
%    by number (PROB) rather than by name.
%
%    In some cases, the "exact" value of the integral is in fact
%    merely a respectable approximation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the number of the desired test problem.
%
%    Output, real EXACT, the exact value of the integral.
%
  if ( prob == 1 )
    exact = p01_exact ( );
  elseif ( prob == 2 )
    exact = p02_exact ( );
  elseif ( prob == 3 )
    exact = p03_exact ( );
  elseif ( prob == 4 )
    exact = p04_exact ( );
  elseif ( prob == 5 )
    exact = p05_exact ( );
  elseif ( prob == 6 )
    exact = p06_exact ( );
  elseif ( prob == 7 )
    exact = p07_exact ( );
  elseif ( prob == 8 )
    exact = p08_exact ( );
  elseif ( prob == 9 )
    exact = p09_exact ( );
  elseif ( prob == 10 )
    exact = p10_exact ( );
  elseif ( prob == 11 )
    exact = p11_exact ( );
  elseif ( prob == 12 )
    exact = p12_exact ( );
  elseif ( prob == 13 )
    exact = p13_exact ( );
  elseif ( prob == 14 )
    exact = p14_exact ( );
  elseif ( prob == 15 )
    exact = p15_exact ( );
  elseif ( prob == 16 )
    exact = p16_exact ( );
  elseif ( prob == 17 )
    exact = p17_exact ( );
  elseif ( prob == 18 )
    exact = p18_exact ( );
  elseif ( prob == 19 )
    exact = p19_exact ( );
  elseif ( prob == 20 )
    exact = p20_exact ( );
  elseif ( prob == 21 )
    exact = p21_exact ( );
  elseif ( prob == 22 )
    exact = p22_exact ( );
  elseif ( prob == 23 )
    exact = p23_exact ( );
  elseif ( prob == 24 )
    exact = p24_exact ( );
  elseif ( prob == 25 )
    exact = p25_exact ( );
  elseif ( prob == 26 )
    exact = p26_exact ( );
  elseif ( prob == 27 )
    exact = p27_exact ( );
  elseif ( prob == 28 )
    exact = p28_exact ( );
  elseif ( prob == 29 )
    exact = p29_exact ( );
  elseif ( prob == 30 )
    exact = p30_exact ( );
  elseif ( prob == 31 )
    exact = p31_exact ( );
  elseif ( prob == 32 )
    exact = p32_exact ( );
  elseif ( prob == 33 )
    exact = p33_exact ( );
  elseif ( prob == 34 )
    exact = p34_exact ( );
  elseif ( prob == 35 )
    exact = p35_exact ( );
  elseif ( prob == 36 )
    exact = p36_exact ( );
  elseif ( prob == 37 )
    exact = p37_exact ( );
  elseif ( prob == 38 )
    exact = p38_exact ( );
  elseif ( prob == 39 )
    exact = p39_exact ( );
  elseif ( prob == 40 )
    exact = p40_exact ( );
  elseif ( prob == 41 )
    exact = p41_exact ( );
  elseif ( prob == 42 )
    exact = p42_exact ( );
  elseif ( prob == 43 )
    exact = p43_exact ( );
  elseif ( prob == 44 )
    exact = p44_exact ( );
  elseif ( prob == 45 )
    exact = p45_exact ( );
  elseif ( prob == 46 )
    exact = p46_exact ( );
  elseif ( prob == 47 )
    exact = p47_exact ( );
  elseif ( prob == 48 )
    exact = p48_exact ( );
  elseif ( prob == 49 )
    exact = p49_exact ( );
  elseif ( prob == 50 )
    exact = p50_exact ( );
  elseif ( prob == 51 )
    exact = p51_exact ( );
  elseif ( prob == 52 )
    exact = p52_exact ( );
  elseif ( prob == 53 )
    exact = p53_exact ( );
  elseif ( prob == 54 )
    exact = p54_exact ( );
  elseif ( prob == 55 )
    exact = p55_exact ( );
  elseif ( prob == 56 )
    exact = p56_exact ( );
  elseif ( prob == 57 )
    exact = p57_exact ( );
  elseif ( prob == 58 )
    exact = p58_exact ( );
  elseif ( prob == 59 )
    exact = p59_exact ( );
  elseif ( prob == 60 )
    exact = p60_exact ( );
  elseif ( prob == 61 )
    exact = p61_exact ( );
  elseif ( prob == 62 )
    exact = p62_exact ( );
  elseif ( prob == 63 )
    exact = p63_exact ( );
  elseif ( prob == 64 )
    exact = p64_exact ( );
  elseif ( prob == 65 )
    exact = p65_exact ( );
  elseif ( prob == 66 )
    exact = p66_exact ( );
  elseif ( prob == 67 )
    exact = p67_exact ( );
  elseif ( prob == 68 )
    exact = p68_exact ( );
  elseif ( prob == 69 )
    exact = p69_exact ( );
  elseif ( prob == 70 )
    exact = p70_exact ( );
  elseif ( prob == 71 )
    exact = p71_exact ( );
  elseif ( prob == 72 )
    exact = p72_exact ( );
  elseif ( prob == 73 )
    exact = p73_exact ( );
  elseif ( prob == 74 )
    exact = p74_exact ( );
  elseif ( prob == 75 )
    exact = p75_exact ( );
  elseif ( prob == 76 )
    exact = p76_exact ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_EXACT - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', prob );
    error ( 'P00_EXACT - Fatal error!' );
  end

  return
end
