function [ a, b ] = p00_lim ( problem )

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
%    18 September 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem index.
%
%    Output, real A(2), B(2), the lower and upper limits of integration.
%
  if ( problem == 1 )
    [ a, b ] = p01_lim ( );
  elseif ( problem == 2 )
    [ a, b ] = p02_lim ( );
  elseif ( problem == 3 )
    [ a, b ] = p03_lim ( );
  elseif ( problem == 4 )
    [ a, b ] = p04_lim ( );
  elseif ( problem == 5 )
    [ a, b ] = p05_lim ( );
  elseif ( problem == 6 )
    [ a, b ] = p06_lim ( );
  elseif ( problem == 7 )
    [ a, b ] = p07_lim ( );
  elseif ( problem == 8 )
    [ a, b ] = p08_lim ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_LIM - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem index = %d\n', problem );
    error ( 'P00_LIM - Fatal error!\n' );
  end

  return
end
