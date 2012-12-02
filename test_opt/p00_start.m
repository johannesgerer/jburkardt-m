function x = p00_start ( problem, n )

%*****************************************************************************80
%
%% P00_START returns a starting point for optimization for any problem.
%
%  Discussion:
%
%    The point returned by this routine does not produce an optimal
%    value of the objective function.  Instead, it is "reasonably far"
%    from an optimizing point, so that an optimization program has
%    a proper workout.
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
%    Input, integer PROBLEM, the number of the problem.
%
%    Input, integer N, the number of variables X.
%
%    Output, real X(N), a starting point for the optimization.
%
  if ( problem == 1 )
    x = p01_start ( n );
  elseif ( problem == 2 )
    x = p02_start ( n );
  elseif ( problem == 3 )
    x = p03_start ( n );
  elseif ( problem == 4 )
    x = p04_start ( n );
  elseif ( problem == 5 )
    x = p05_start ( n );
  elseif ( problem == 6 )
    x = p06_start ( n );
  elseif ( problem == 7 )
    x = p07_start ( n );
  elseif ( problem == 8 )
    x = p08_start ( n );
  elseif ( problem == 9 )
    x = p09_start ( n );
  elseif ( problem == 10 )
    x = p10_start ( n );
  elseif ( problem == 11 )
    x = p11_start ( n );
  elseif ( problem == 12 )
    x = p12_start ( n );
  elseif ( problem == 13 )
    x = p13_start ( n );
  elseif ( problem == 14 )
    x = p14_start ( n );
  elseif ( problem == 15 )
    x = p15_start ( n );
  elseif ( problem == 16 )
    x = p16_start ( n );
  elseif ( problem == 17 )
    x = p17_start ( n );
  elseif ( problem == 18 )
    x = p18_start ( n );
  elseif ( problem == 19 )
    x = p19_start ( n );
  elseif ( problem == 20 )
    x = p20_start ( n );
  elseif ( problem == 21 )
    x = p21_start ( n );
  elseif ( problem == 22 )
    x = p22_start ( n );
  elseif ( problem == 23 )
    x = p23_start ( n );
  elseif ( problem == 24 )
    x = p24_start ( n );
  elseif ( problem == 25 )
    x = p25_start ( n );
  elseif ( problem == 26 )
    x = p26_start ( n );
  elseif ( problem == 27 )
    x = p27_start ( n );
  elseif ( problem == 28 )
    x = p28_start ( n );
  elseif ( problem == 29 )
    x = p29_start ( n );
  elseif ( problem == 30 )
    x = p30_start ( n );
  elseif ( problem == 31 )
    x = p31_start ( n );
  elseif ( problem == 32 )
    x = p32_start ( n );
  elseif ( problem == 33 )
    x = p33_start ( n );
  elseif ( problem == 34 )
    x = p34_start ( n );
  elseif ( problem == 35 )
    x = p35_start ( n );
  elseif ( problem == 36 )
    x = p36_start ( n );
  elseif ( problem == 37 )
    x = p37_start ( n );
  elseif ( problem == 38 )
    x = p38_start ( n );
  elseif ( problem == 39 )
    x = p39_start ( n );
  elseif ( problem == 40 )
    x = p40_start ( n );
  elseif ( problem == 41 )
    x = p41_start ( n );
  elseif ( problem == 42 )
    x = p42_start ( n );
  elseif ( problem == 43 )
    x = p43_start ( n );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_START - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of PROBLEM = %d\n', problem );
    error ( 'P00_START - Fatal error!' );
  end

  return
end
