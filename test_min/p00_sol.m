function [ know, x ] = p00_sol ( problem )

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
%    03 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem number.
%
%    Output, integer KNOW.
%    If KNOW is 0, then the solution is not known.
%    If KNOW is positive, then the solution is known, and is returned in X.
%
%    Output, real X, the solution, if known.
%
  if ( problem == 1 )
    [ know, x ] = p01_sol ( );
  elseif ( problem == 2 )
    [ know, x ] = p02_sol ( );
  elseif ( problem == 3 )
    [ know, x ] = p03_sol ( );
  elseif ( problem == 4 )
    [ know, x ] = p04_sol ( );
  elseif ( problem == 5 )
    [ know, x ] = p05_sol ( );
  elseif ( problem == 6 )
    [ know, x ] = p06_sol ( );
  elseif ( problem == 7 )
    [ know, x ] = p07_sol ( );
  elseif ( problem == 8 )
    [ know, x ] = p08_sol ( );
  elseif ( problem == 9 )
    [ know, x ] = p09_sol ( );
  elseif ( problem == 10 )
    [ know, x ] = p10_sol ( );
  elseif ( problem == 11 )
    [ know, x ] = p11_sol ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_SOL - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number PROBLEM = %d\n', problem );
    error ( 'P00_SOL - Fatal error!' );
  end

  return
end
