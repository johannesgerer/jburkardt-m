function fx = p00_fun ( prob, n, x )

%*****************************************************************************80
%
%% P00_FUN evaluates the integrand for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the number of the desired test problem.
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  if ( prob == 1 )
    fx = p01_fun ( n, x );
  elseif ( prob == 2 )
    fx = p02_fun ( n, x );
  elseif ( prob == 3 )
    fx = p03_fun ( n, x );
  elseif ( prob == 4 )
    fx = p04_fun ( n, x );
  elseif ( prob == 5 )
    fx = p05_fun ( n, x );
  elseif ( prob == 6 )
    fx = p06_fun ( n, x );
  elseif ( prob == 7 )
    fx = p07_fun ( n, x );
  elseif ( prob == 8 )
    fx = p08_fun ( n, x );
  elseif ( prob == 9 )
    fx = p09_fun ( n, x );
  elseif ( prob == 10 )
    fx = p10_fun ( n, x );
  elseif ( prob == 11 )
    fx = p11_fun ( n, x );
  elseif ( prob == 12 )
    fx = p12_fun ( n, x );
  elseif ( prob == 13 )
    fx = p13_fun ( n, x );
  elseif ( prob == 14 )
    fx = p14_fun ( n, x );
  elseif ( prob == 15 )
    fx = p15_fun ( n, x );
  elseif ( prob == 16 )
    fx = p16_fun ( n, x );
  elseif ( prob == 17 )
    fx = p17_fun ( n, x );
  elseif ( prob == 18 )
    fx = p18_fun ( n, x );
  elseif ( prob == 19 )
    fx = p19_fun ( n, x );
  elseif ( prob == 20 )
    fx = p20_fun ( n, x );
  elseif ( prob == 21 )
    fx = p21_fun ( n, x );
  elseif ( prob == 22 )
    fx = p22_fun ( n, x );
  elseif ( prob == 23 )
    fx = p23_fun ( n, x );
  elseif ( prob == 24 )
    fx = p24_fun ( n, x );
  elseif ( prob == 25 )
    fx = p25_fun ( n, x );
  elseif ( prob == 26 )
    fx = p26_fun ( n, x );
  elseif ( prob == 27 )
    fx = p27_fun ( n, x );
  elseif ( prob == 28 )
    fx = p28_fun ( n, x );
  elseif ( prob == 29 )
    fx = p29_fun ( n, x );
  elseif ( prob == 30 )
    fx = p30_fun ( n, x );
  elseif ( prob == 31 )
    fx = p31_fun ( n, x );
  elseif ( prob == 32 )
    fx = p32_fun ( n, x );
  elseif ( prob == 33 )
    fx = p33_fun ( n, x );
  elseif ( prob == 34 )
    fx = p34_fun ( n, x );
  elseif ( prob == 35 )
    fx = p35_fun ( n, x );
  elseif ( prob == 36 )
    fx = p36_fun ( n, x );
  elseif ( prob == 37 )
    fx = p37_fun ( n, x );
  elseif ( prob == 38 )
    fx = p38_fun ( n, x );
  elseif ( prob == 39 )
    fx = p39_fun ( n, x );
  elseif ( prob == 40 )
    fx = p40_fun ( n, x );
  elseif ( prob == 41 )
    fx = p41_fun ( n, x );
  elseif ( prob == 42 )
    fx = p42_fun ( n, x );
  elseif ( prob == 43 )
    fx = p43_fun ( n, x );
  elseif ( prob == 44 )
    fx = p44_fun ( n, x );
  elseif ( prob == 45 )
    fx = p45_fun ( n, x );
  elseif ( prob == 46 )
    fx = p46_fun ( n, x );
  elseif ( prob == 47 )
    fx = p47_fun ( n, x );
  elseif ( prob == 48 )
    fx = p48_fun ( n, x );
  elseif ( prob == 49 )
    fx = p49_fun ( n, x );
  elseif ( prob == 50 )
    fx = p50_fun ( n, x );
  elseif ( prob == 51 )
    fx = p51_fun ( n, x );
  elseif ( prob == 52 )
    fx = p52_fun ( n, x );
  elseif ( prob == 53 )
    fx = p53_fun ( n, x );
  elseif ( prob == 54 )
    fx = p54_fun ( n, x );
  elseif ( prob == 55 )
    fx = p55_fun ( n, x );
  elseif ( prob == 56 )
    fx = p56_fun ( n, x );
  elseif ( prob == 57 )
    fx = p57_fun ( n, x );
  elseif ( prob == 58 )
    fx = p58_fun ( n, x );
  elseif ( prob == 59 )
    fx = p59_fun ( n, x );
  elseif ( prob == 60 )
    fx = p60_fun ( n, x );
  elseif ( prob == 61 )
    fx = p61_fun ( n, x );
  elseif ( prob == 62 )
    fx = p62_fun ( n, x );
  elseif ( prob == 63 )
    fx = p63_fun ( n, x );
  elseif ( prob == 64 )
    fx = p64_fun ( n, x );
  elseif ( prob == 65 )
    fx = p65_fun ( n, x );
  elseif ( prob == 66 )
    fx = p66_fun ( n, x );
  elseif ( prob == 67 )
    fx = p67_fun ( n, x );
  elseif ( prob == 68 )
    fx = p68_fun ( n, x );
  elseif ( prob == 69 )
    fx = p69_fun ( n, x );
  elseif ( prob == 70 )
    fx = p70_fun ( n, x );
  elseif ( prob == 71 )
    fx = p71_fun ( n, x );
  elseif ( prob == 72 )
    fx = p72_fun ( n, x );
  elseif ( prob == 73 )
    fx = p73_fun ( n, x );
  elseif ( prob == 74 )
    fx = p74_fun ( n, x );
  elseif ( prob == 75 )
    fx = p75_fun ( n, x );
  elseif ( prob == 76 )
    fx = p76_fun ( n, x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_FUN - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', prob );
    error ( 'P00_FUN - Fatal error!' );
  end

  return
end
