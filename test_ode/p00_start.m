function [ t_start, y_start ] = p00_start ( test, neqn )

%*****************************************************************************80
%
%% P00_START returns the initial data for any test problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TEST, the test problem index.
%
%    Input, integer NEQN, the number of equations.
%
%    Output, real T_START, the initial time.
%
%    Output, real Y_START(NEQN,1), the initial value of the dependent
%    variables.
%
  y_start = zeros ( neqn, 1 );

  if ( test == 1 )
    [ t_start, y_start ] = p01_start ( neqn );
  elseif ( test == 2 )
    [ t_start, y_start ] = p02_start ( neqn );
  elseif ( test == 3 )
    [ t_start, y_start ] = p03_start ( neqn );
  elseif ( test == 4 )
    [ t_start, y_start ] = p04_start ( neqn );
  elseif ( test == 5 )
    [ t_start, y_start ] = p05_start ( neqn );
  elseif ( test == 6 )
    [ t_start, y_start ] = p06_start ( neqn );
  elseif ( test == 7 )
    [ t_start, y_start ] = p07_start ( neqn );
  elseif ( test == 8 )
    [ t_start, y_start ] = p08_start ( neqn );
  elseif ( test == 9 )
    [ t_start, y_start ] = p09_start ( neqn );
  elseif ( test == 10 )
    [ t_start, y_start ] = p10_start ( neqn );
  elseif ( test == 11 )
    [ t_start, y_start ] = p11_start ( neqn );
  elseif ( test == 12 )
    [ t_start, y_start ] = p12_start ( neqn );
  elseif ( test == 13 )
    [ t_start, y_start ] = p13_start ( neqn );
  elseif ( test == 14 )
    [ t_start, y_start ] = p14_start ( neqn );
  elseif ( test == 15 )
    [ t_start, y_start ] = p15_start ( neqn );
  elseif ( test == 16 )
    [ t_start, y_start ] = p16_start ( neqn );
  elseif ( test == 17 )
    [ t_start, y_start ] = p17_start ( neqn );
  elseif ( test == 18 )
    [ t_start, y_start ] = p18_start ( neqn );
  elseif ( test == 19 )
    [ t_start, y_start ] = p19_start ( neqn );
  elseif ( test == 20 )
    [ t_start, y_start ] = p20_start ( neqn );
  elseif ( test == 21 )
    [ t_start, y_start ] = p21_start ( neqn );
  elseif ( test == 22 )
    [ t_start, y_start ] = p22_start ( neqn );
  elseif ( test == 23 )
    [ t_start, y_start ] = p23_start ( neqn );
  elseif ( test == 24 )
    [ t_start, y_start ] = p24_start ( neqn );
  elseif ( test == 25 )
    [ t_start, y_start ] = p25_start ( neqn );
  elseif ( test == 26 )
    [ t_start, y_start ] = p26_start ( neqn );
  elseif ( test == 27 )
    [ t_start, y_start ] = p27_start ( neqn );
  elseif ( test == 28 )
    [ t_start, y_start ] = p28_start ( neqn );
  elseif ( test == 29 )
    [ t_start, y_start ] = p29_start ( neqn );
  elseif ( test == 30 )
    [ t_start, y_start ] = p30_start ( neqn );
  elseif ( test == 31 )
    [ t_start, y_start ] = p31_start ( neqn );
  elseif ( test == 32 )
    [ t_start, y_start ] = p32_start ( neqn );
  elseif ( test == 33 )
    [ t_start, y_start ] = p33_start ( neqn );
  elseif ( test == 34 )
    [ t_start, y_start ] = p34_start ( neqn );
  elseif ( test == 35 )
    [ t_start, y_start ] = p35_start ( neqn );
  elseif ( test == 36 )
    [ t_start, y_start ] = p36_start ( neqn );
  elseif ( test == 37 )
    [ t_start, y_start ] = p37_start ( neqn );
  elseif ( test == 38 )
    [ t_start, y_start ] = p38_start ( neqn );
  elseif ( test == 39 )
    [ t_start, y_start ] = p39_start ( neqn );
  elseif ( test == 40 )
    [ t_start, y_start ] = p40_start ( neqn );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_START - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem index TEST = %d\n', test );
    error ( 'P00_START - Fatal error!' );
  end

  return
end
