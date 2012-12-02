function fx = p00_f ( p, n, x )

%*****************************************************************************80
%
%% P00_F evaluates the integrand for a given problem.
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
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  if ( p == 1 )
    fx = p01_f ( n, x );
  elseif ( p == 2 )
    fx = p02_f ( n, x );
  elseif ( p == 3 )
    fx = p03_f ( n, x );
  elseif ( p == 4 )
    fx = p04_f ( n, x );
  elseif ( p == 5 )
    fx = p05_f ( n, x );
  elseif ( p == 6 )
    fx = p06_f ( n, x );
  elseif ( p == 7 )
    fx = p07_f ( n, x );
  elseif ( p == 8 )
    fx = p08_f ( n, x );
  elseif ( p == 9 )
    fx = p09_f ( n, x );
  elseif ( p == 10 )
    fx = p10_f ( n, x );
  elseif ( p == 11 )
    fx = p11_f ( n, x );
  elseif ( p == 12 )
    fx = p12_f ( n, x );
  elseif ( p == 13 )
    fx = p13_f ( n, x );
  elseif ( p == 14 )
    fx = p14_f ( n, x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_F - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of P = %d\n', p );
    error ( 'P00_F - Fatal error!' );
  end

  return
end
