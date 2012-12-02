function x = p00_start ( problem )

%*****************************************************************************80
%
%% P00_START returns a starting point for optimization for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem index.
%
%    Output, real X, a starting point for the optimization.
%
  if ( problem == 1 )
    x = p01_start ( );
  elseif ( problem == 2 )
    x = p02_start ( );
  elseif ( problem == 3 )
    x = p03_start ( );
  elseif ( problem == 4 )
    x = p04_start ( );
  elseif ( problem == 5 )
    x = p05_start ( );
  elseif ( problem == 6 )
    x = p06_start ( );
  elseif ( problem == 7 )
    x = p07_start ( );
  elseif ( problem == 8 )
    x = p08_start ( );
  elseif ( problem == 9 )
    x = p09_start ( );
  elseif ( problem == 10 )
    x = p10_start ( );
  elseif ( problem == 11 )
    x = p11_start ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_START - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number PROBLEM = %d\n', problem );
    error ( 'P00_START - Fatal error!' );
  end

  return
end
