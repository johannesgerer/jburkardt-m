function [ a, b ] = p00_lim ( prob )

%*****************************************************************************80
%
%% P00_LIM returns the integration limits for any problem.
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
%    Output, real A, B, the limits of integration.
%
  if ( prob == 1 )
    [ a, b ] = p01_lim ( );
  elseif ( prob == 2 )
    [ a, b ] = p02_lim ( );
  elseif ( prob == 3 )
    [ a, b ] = p03_lim ( );
  elseif ( prob == 4 )
    [ a, b ] = p04_lim ( );
  elseif ( prob == 5 )
    [ a, b ] = p05_lim ( );
  elseif ( prob == 6 )
    [ a, b ] = p06_lim ( );
  elseif ( prob == 7 )
    [ a, b ] = p07_lim ( );
  elseif ( prob == 8 )
    [ a, b ] = p08_lim ( );
  elseif ( prob == 9 )
    [ a, b ] = p09_lim ( );
  elseif ( prob == 10 )
    [ a, b ] = p10_lim ( );
  elseif ( prob == 11 )
    [ a, b ] = p11_lim ( );
  elseif ( prob == 12 )
    [ a, b ] = p12_lim ( );
  elseif ( prob == 13 )
    [ a, b ] = p13_lim ( );
  elseif ( prob == 14 )
    [ a, b ] = p14_lim ( );
  elseif ( prob == 15 )
    [ a, b ] = p15_lim ( );
  elseif ( prob == 16 )
    [ a, b ] = p16_lim ( );
  elseif ( prob == 17 )
    [ a, b ] = p17_lim ( );
  elseif ( prob == 18 )
    [ a, b ] = p18_lim ( );
  elseif ( prob == 19 )
    [ a, b ] = p19_lim ( );
  elseif ( prob == 20 )
    [ a, b ] = p20_lim ( );
  elseif ( prob == 21 )
    [ a, b ] = p21_lim ( );
  elseif ( prob == 22 )
    [ a, b ] = p22_lim ( );
  elseif ( prob == 23 )
    [ a, b ] = p23_lim ( );
  elseif ( prob == 24 )
    [ a, b ] = p24_lim ( );
  elseif ( prob == 25 )
    [ a, b ] = p25_lim ( );
  elseif ( prob == 26 )
    [ a, b ] = p26_lim ( );
  elseif ( prob == 27 )
    [ a, b ] = p27_lim ( );
  elseif ( prob == 28 )
    [ a, b ] = p28_lim ( );
  elseif ( prob == 29 )
    [ a, b ] = p29_lim ( );
  elseif ( prob == 30 )
    [ a, b ] = p30_lim ( );
  elseif ( prob == 31 )
    [ a, b ] = p31_lim ( );
  elseif ( prob == 32 )
    [ a, b ] = p32_lim ( );
  elseif ( prob == 33 )
    [ a, b ] = p33_lim ( );
  elseif ( prob == 34 )
    [ a, b ] = p34_lim ( );
  elseif ( prob == 35 )
    [ a, b ] = p35_lim ( );
  elseif ( prob == 36 )
    [ a, b ] = p36_lim ( );
  elseif ( prob == 37 )
    [ a, b ] = p37_lim ( );
  elseif ( prob == 38 )
    [ a, b ] = p38_lim ( );
  elseif ( prob == 39 )
    [ a, b ] = p39_lim ( );
  elseif ( prob == 40 )
    [ a, b ] = p40_lim ( );
  elseif ( prob == 41 )
    [ a, b ] = p41_lim ( );
  elseif ( prob == 42 )
    [ a, b ] = p42_lim ( );
  elseif ( prob == 43 )
    [ a, b ] = p43_lim ( );
  elseif ( prob == 44 )
    [ a, b ] = p44_lim ( );
  elseif ( prob == 45 )
    [ a, b ] = p45_lim ( );
  elseif ( prob == 46 )
    [ a, b ] = p46_lim ( );
  elseif ( prob == 47 )
    [ a, b ] = p47_lim ( );
  elseif ( prob == 48 )
    [ a, b ] = p48_lim ( );
  elseif ( prob == 49 )
    [ a, b ] = p49_lim ( );
  elseif ( prob == 50 )
    [ a, b ] = p50_lim ( );
  elseif ( prob == 51 )
    [ a, b ] = p51_lim ( );
  elseif ( prob == 52 )
    [ a, b ] = p52_lim ( );
  elseif ( prob == 53 )
    [ a, b ] = p53_lim ( );
  elseif ( prob == 54 )
    [ a, b ] = p54_lim ( );
  elseif ( prob == 55 )
    [ a, b ] = p55_lim ( );
  elseif ( prob == 56 )
    [ a, b ] = p56_lim ( );
  elseif ( prob == 57 )
    [ a, b ] = p57_lim ( );
  elseif ( prob == 58 )
    [ a, b ] = p58_lim ( );
  elseif ( prob == 59 )
    [ a, b ] = p59_lim ( );
  elseif ( prob == 60 )
    [ a, b ] = p60_lim ( );
  elseif ( prob == 61 )
    [ a, b ] = p61_lim ( );
  elseif ( prob == 62 )
    [ a, b ] = p62_lim ( );
  elseif ( prob == 63 )
    [ a, b ] = p63_lim ( );
  elseif ( prob == 64 )
    [ a, b ] = p64_lim ( );
  elseif ( prob == 65 )
    [ a, b ] = p65_lim ( );
  elseif ( prob == 66 )
    [ a, b ] = p66_lim ( );
  elseif ( prob == 67 )
    [ a, b ] = p67_lim ( );
  elseif ( prob == 68 )
    [ a, b ] = p68_lim ( );
  elseif ( prob == 69 )
    [ a, b ] = p69_lim ( );
  elseif ( prob == 70 )
    [ a, b ] = p70_lim ( );
  elseif ( prob == 71 )
    [ a, b ] = p71_lim ( );
  elseif ( prob == 72 )
    [ a, b ] = p72_lim ( );
  elseif ( prob == 73 )
    [ a, b ] = p73_lim ( );
  elseif ( prob == 74 )
    [ a, b ] = p74_lim ( );
  elseif ( prob == 75 )
    [ a, b ] = p75_lim ( );
  elseif ( prob == 76 )
    [ a, b ] = p76_lim ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_LIM - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', prob );
    error ( 'P00_LIM - Fatal error!' );
  end

  return
end
