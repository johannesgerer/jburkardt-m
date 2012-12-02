function [ a, b ] = p00_interval ( problem )

%*****************************************************************************80
%
%% P00_INTERVAL returns a bracketing interval for any problem.
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
%    Output, real A, B, two points, between which a local
%    minimizer should be sought.
%
  if ( problem == 1 )
    [ a, b ] =  p01_interval ( );
  elseif ( problem == 2 )
    [ a, b ] =  p02_interval ( );
  elseif ( problem == 3 )
    [ a, b ] =  p03_interval ( );
  elseif ( problem == 4 )
    [ a, b ] =  p04_interval ( );
  elseif ( problem == 5 )
    [ a, b ] =  p05_interval ( );
  elseif ( problem == 6 )
    [ a, b ] =  p06_interval ( );
  elseif ( problem == 7 )
    [ a, b ] =  p07_interval ( );
  elseif ( problem == 8 )
    [ a, b ] =  p08_interval ( );
  elseif ( problem == 9 )
    [ a, b ] =  p09_interval ( );
  elseif ( problem == 10 )
    [ a, b ] =  p10_interval ( );
  elseif ( problem == 11 )
    [ a, b ] =  p11_interval ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_INTERVAL - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number PROBLEM = %d\n', problem );
    error ( 'P00_INTERVAL - Fatal error!' );
  end

  return
end
