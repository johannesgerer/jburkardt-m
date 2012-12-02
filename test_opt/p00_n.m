function n = p00_n ( problem )

%*****************************************************************************80
%
%% P00_N returns the number of variables for any problem.
%
%  Discussion:
%
%    Some of the problems in this set have only a single appropriate
%    size.  Others can take any value for N.  Others, alas, can take
%    SOME values of N.
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
%    Output, integer N.  If N is positive, N represents the
%    only legal value for N for this problem.  If N is
%    negative, the absolute value of N is the least legal
%    value of N, but other values are allowable.
%
  if ( problem == 1 )
    n = p01_n ( );
  elseif ( problem == 2 )
    n = p02_n ( );
  elseif ( problem == 3 )
    n = p03_n ( );
  elseif ( problem == 4 )
    n = p04_n ( );
  elseif ( problem == 5 )
    n = p05_n ( );
  elseif ( problem == 6 )
    n = p06_n ( );
  elseif ( problem == 7 )
    n = p07_n ( );
  elseif ( problem == 8 )
    n = p08_n ( );
  elseif ( problem == 9 )
    n = p09_n ( );
  elseif ( problem == 10 )
    n = p10_n ( );
  elseif ( problem == 11 )
    n = p11_n ( );
  elseif ( problem == 12 )
    n = p12_n ( );
  elseif ( problem == 13 )
    n = p13_n ( );
  elseif ( problem == 14 )
    n = p14_n ( );
  elseif ( problem == 15 )
    n = p15_n ( );
  elseif ( problem == 16 )
    n = p16_n ( );
  elseif ( problem == 17 )
    n = p17_n ( );
  elseif ( problem == 18 )
    n = p18_n ( );
  elseif ( problem == 19 )
    n = p19_n ( );
  elseif ( problem == 20 )
    n = p20_n ( );
  elseif ( problem == 21 )
    n = p21_n ( );
  elseif ( problem == 22 )
    n = p22_n ( );
  elseif ( problem == 23 )
    n = p23_n ( );
  elseif ( problem == 24 )
    n = p24_n ( );
  elseif ( problem == 25 )
    n = p25_n ( );
  elseif ( problem == 26 )
    n = p26_n ( );
  elseif ( problem == 27 )
    n = p27_n ( );
  elseif ( problem == 28 )
    n = p28_n ( );
  elseif ( problem == 29 )
    n = p29_n ( );
  elseif ( problem == 30 )
    n = p30_n ( );
  elseif ( problem == 31 )
    n = p31_n ( );
  elseif ( problem == 32 )
    n = p32_n ( );
  elseif ( problem == 33 )
    n = p33_n ( );
  elseif ( problem == 34 )
    n = p34_n ( );
  elseif ( problem == 35 )
    n = p35_n ( );
  elseif ( problem == 36 )
    n = p36_n ( );
  elseif ( problem == 37 )
    n = p37_n ( );
  elseif ( problem == 38 )
    n = p38_n ( );
  elseif ( problem == 39 )
    n = p39_n ( );
  elseif ( problem == 40 )
    n = p40_n ( );
  elseif ( problem == 41 )
    n = p41_n ( );
  elseif ( problem == 42 )
    n = p42_n ( );
  elseif ( problem == 43 )
    n = p43_n ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_N - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of PROBLEM = %d\n', problem );
    error ( 'P00_N - Fatal error!' );
  end

  return
end
