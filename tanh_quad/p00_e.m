function exact = p00_e ( p )

%*****************************************************************************80
%
%% P00_E returns the exact value of the integral for a given problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer P, the problem index.
%
%    Output, real EXACT, the exact value of the integral.
%
  if ( p == 1 )
    exact = p01_e ( );
  elseif ( p == 2 )
    exact = p02_e ( );
  elseif ( p == 3 )
    exact = p03_e ( );
  elseif ( p == 4 )
    exact = p04_e ( );
  elseif ( p == 5 )
    exact = p05_e ( );
  elseif ( p == 6 )
    exact = p06_e ( );
  elseif ( p == 7 )
    exact = p07_e ( );
  elseif ( p == 8 )
    exact = p08_e ( );
  elseif ( p == 9 )
    exact = p09_e ( );
  elseif ( p == 10 )
    exact = p10_e ( );
  elseif ( p == 11 )
    exact = p11_e ( );
  elseif ( p == 12 )
    exact = p12_e ( );
  elseif ( p == 13 )
    exact = p13_e ( );
  elseif ( p == 14 )
    exact = p14_e ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_E - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of P = %d\n', p );
    error ( 'P00_E - Fatal error!' );
  end

  return
end
