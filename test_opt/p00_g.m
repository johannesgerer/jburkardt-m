function g = p00_g ( problem, n, x )

%*****************************************************************************80
%
%% P00_G evaluates the gradient for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem number.
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the values of the variables.
%
%    Output, real G(N), the gradient of the objective function.
%
  if ( problem == 1 )
    g = p01_g ( n, x );
  elseif ( problem == 2 )
    g = p02_g ( n, x );
  elseif ( problem == 3 )
    g = p03_g ( n, x );
  elseif ( problem == 4 )
    g = p04_g ( n, x );
  elseif ( problem == 5 )
    g = p05_g ( n, x );
  elseif ( problem == 6 )
    g = p06_g ( n, x );
  elseif ( problem == 7 )
    g = p07_g ( n, x );
  elseif ( problem == 8 )
    g = p08_g ( n, x );
  elseif ( problem == 9 )
    g = p09_g ( n, x );
  elseif ( problem == 10 )
    g = p10_g ( n, x );
  elseif ( problem == 11 )
    g = p11_g ( n, x );
  elseif ( problem == 12 )
    g = p12_g ( n, x );
  elseif ( problem == 13 )
    g = p13_g ( n, x );
  elseif ( problem == 14 )
    g = p14_g ( n, x );
  elseif ( problem == 15 )
    g = p15_g ( n, x );
  elseif ( problem == 16 )
    g = p16_g ( n, x );
  elseif ( problem == 17 )
    g = p17_g ( n, x );
  elseif ( problem == 18 )
    g = p18_g ( n, x );
  elseif ( problem == 19 )
    g = p19_g ( n, x );
  elseif ( problem == 20 )
    g = p20_g ( n, x );
  elseif ( problem == 21 )
    g = p21_g ( n, x );
  elseif ( problem == 22 )
    g = p22_g ( n, x );
  elseif ( problem == 23 )
    g = p23_g ( n, x );
  elseif ( problem == 24 )
    g = p24_g ( n, x );
  elseif ( problem == 25 )
    g = p25_g ( n, x );
  elseif ( problem == 26 )
    g = p26_g ( n, x );
  elseif ( problem == 27 )
    g = p27_g ( n, x );
  elseif ( problem == 28 )
    g = p28_g ( n, x );
  elseif ( problem == 29 )
    g = p29_g ( n, x );
  elseif ( problem == 30 )
    g = p30_g ( n, x );
  elseif ( problem == 31 )
    g = p31_g ( n, x );
  elseif ( problem == 32 )
    g = p32_g ( n, x );
  elseif ( problem == 33 )
    g = p33_g ( n, x );
  elseif ( problem == 34 )
    g = p34_g ( n, x );
  elseif ( problem == 35 )
    g = p35_g ( n, x );
  elseif ( problem == 36 )
    g = p36_g ( n, x );
  elseif ( problem == 37 )
    g = p37_g ( n, x );
  elseif ( problem == 38 )
    g = p38_g ( n, x );
  elseif ( problem == 39 )
    g = p39_g ( n, x );
  elseif ( problem == 40 )
    g = p40_g ( n, x );
  elseif ( problem == 41 )
    g = p41_g ( n, x );
  elseif ( problem == 42 )
    g = p42_g ( n, x );
  elseif ( problem == 43 )
    g = p43_g ( n, x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_G - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of PROBLEM = %d\n', problem );
    error ( 'P00_G - Fatal error!' );
  end

  return
end
