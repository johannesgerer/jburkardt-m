function [ a, b ] = p00_ab ( problem, m )

%*****************************************************************************80
%
%% P00_AB evaluates the limits of the optimization region for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Marcin Molga, Czeslaw Smutnicki,
%    Test functions for optimization needs.
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem number.
%
%    Input, integer M, the number of variables.
%
%    Output, real A(M), B(M), the lower and upper bounds.
%
  if ( problem == 1 )
    [ a, b ] = p01_ab ( m );
  elseif ( problem == 2 )
    [ a, b ] = p02_ab ( m );
  elseif ( problem == 3 )
    [ a, b ] = p03_ab ( m );
  elseif ( problem == 4 )
    [ a, b ] = p04_ab ( m );
  elseif ( problem == 5 )
    [ a, b ] = p05_ab ( m );
  elseif ( problem == 6 )
    [ a, b ] = p06_ab ( m );
  elseif ( problem == 7 )
    [ a, b ] = p07_ab ( m );
  elseif ( problem == 8 )
    [ a, b ] = p08_ab ( m );
  elseif ( problem == 9 )
    [ a, b ] = p09_ab ( m );
  elseif ( problem == 10 )
    [ a, b ] = p10_ab ( m );
  elseif ( problem == 11 )
    [ a, b ] = p11_ab ( m );
  elseif ( problem == 12 )
    [ a, b ] = p12_ab ( m );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_AB - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of PROBLEM =  %d\n', problem );
    error ( 'P00_AB - Fatal error!' );
  end

  return
end
