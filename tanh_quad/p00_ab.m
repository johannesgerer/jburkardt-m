function [ a, b ] = p00_ab ( p )

%*****************************************************************************80
%
%% P00_AB returns the integration limits for a given problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer P, the problem index.
%
%    Output, real A, B, the integration limits.
%
  if ( p == 1 )
    [ a, b ] = p01_ab ( );
  elseif ( p == 2 )
    [ a, b ] = p02_ab ( );
  elseif ( p == 3 )
    [ a, b ] = p03_ab ( );
  elseif ( p == 4 )
    [ a, b ] = p04_ab ( );
  elseif ( p == 5 )
    [ a, b ] = p05_ab ( );
  elseif ( p == 6 )
    [ a, b ] = p06_ab ( );
  elseif ( p == 7 )
    [ a, b ] = p07_ab ( );
  elseif ( p == 8 )
    [ a, b ] = p08_ab ( );
  elseif ( p == 9 )
    [ a, b ] = p09_ab ( );
  elseif ( p == 10 )
    [ a, b ] = p10_ab ( );
  elseif ( p == 11 )
    [ a, b ] = p11_ab ( );
  elseif ( p == 12 )
    [ a, b ] = p12_ab ( );
  elseif ( p == 13 )
    [ a, b ] = p13_ab ( );
  elseif ( p == 14 )
    [ a, b ] = p14_ab ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_AB - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of P = %d\n', p );
    error ( 'P00_AB - Fatal error!' );
  end

  return
end
