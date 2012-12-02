function [ know, x ] = p00_sol ( problem, n )

%*****************************************************************************80
%
%% P00_SOL returns the solution for any problem.
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
%    Input, integer N, the order of the problem.  This value
%    is only needed for those problems with variable N.
%
%    Output, integer KNOW.
%    If KNOW is 0, then the solution is not known.
%    If KNOW is positive, then the solution is known, and is returned in X.
%
%    Output, real X(N), the solution, if known.
%
  if ( problem == 1 )
    [ know, x ] = p01_sol ( n );
  elseif ( problem == 2 )
    [ know, x ] = p02_sol ( n );
  elseif ( problem == 3 )
    [ know, x ] = p03_sol ( n );
  elseif ( problem == 4 )
    [ know, x ] = p04_sol ( n );
  elseif ( problem == 5 )
    [ know, x ] = p05_sol ( n );
  elseif ( problem == 6 )
    [ know, x ] = p06_sol ( n );
  elseif ( problem == 7 )
    [ know, x ] = p07_sol ( n );
  elseif ( problem == 8 )
    [ know, x ] = p08_sol ( n );
  elseif ( problem == 9 )
    [ know, x ] = p09_sol ( n );
  elseif ( problem == 10 )
    [ know, x ] = p10_sol ( n );
  elseif ( problem == 11 )
    [ know, x ] = p11_sol ( n );
  elseif ( problem == 12 )
    [ know, x ] = p12_sol ( n );
  elseif ( problem == 13 )
    [ know, x ] = p13_sol ( n );
  elseif ( problem == 14 )
    [ know, x ] = p14_sol ( n );
  elseif ( problem == 15 )
    [ know, x ] = p15_sol ( n );
  elseif ( problem == 16 )
    [ know, x ] = p16_sol ( n );
  elseif ( problem == 17 )
    [ know, x ] = p17_sol ( n );
  elseif ( problem == 18 )
    [ know, x ] = p18_sol ( n );
  elseif ( problem == 19 )
    [ know, x ] = p19_sol ( n );
  elseif ( problem == 20 )
    [ know, x ] = p20_sol ( n );
  elseif ( problem == 21 )
    [ know, x ] = p21_sol ( n );
  elseif ( problem == 22 )
    [ know, x ] = p22_sol ( n );
  elseif ( problem == 23 )
    [ know, x ] = p23_sol ( n );
  elseif ( problem == 24 )
    [ know, x ] = p24_sol ( n );
  elseif ( problem == 25 )
    [ know, x ] = p25_sol ( n );
  elseif ( problem == 26 )
    [ know, x ] = p26_sol ( n );
  elseif ( problem == 27 )
    [ know, x ] = p27_sol ( n );
  elseif ( problem == 28 )
    [ know, x ] = p28_sol ( n );
  elseif ( problem == 29 )
    [ know, x ] = p29_sol ( n );
  elseif ( problem == 30 )
    [ know, x ] = p30_sol ( n );
  elseif ( problem == 31 )
    [ know, x ] = p31_sol ( n );
  elseif ( problem == 32 )
    [ know, x ] = p32_sol ( n );
  elseif ( problem == 33 )
    [ know, x ] = p33_sol ( n );
  elseif ( problem == 34 )
    [ know, x ] = p34_sol ( n );
  elseif ( problem == 35 )
    [ know, x ] = p35_sol ( n );
  elseif ( problem == 36 )
    [ know, x ] = p36_sol ( n );
  elseif ( problem == 37 )
    [ know, x ] = p37_sol ( n );
  elseif ( problem == 38 )
    [ know, x ] = p38_sol ( n );
  elseif ( problem == 39 )
    [ know, x ] = p39_sol ( n );
  elseif ( problem == 40 )
    [ know, x ] = p40_sol ( n );
  elseif ( problem == 41 )
    [ know, x ] = p41_sol ( n );
  elseif ( problem == 42 )
    [ know, x ] = p42_sol ( n );
  elseif ( problem == 43 )
    [ know, x ] = p43_sol ( n );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_SOL - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of PROBLEM = %d\n', problem );
    error ( 'P00_SOL - Fatal error!' );
  end

  return
end
