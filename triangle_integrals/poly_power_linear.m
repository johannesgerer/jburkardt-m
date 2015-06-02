function [ d2, p2 ] = poly_power_linear ( d1, p1, n )

%*****************************************************************************80
%
%% POLY_POWER_LINEAR computes the polynomial ( a + b*x + c*y ) ^ n.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/poly_power_linear.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer D1, the degree of the linear polynomial,
%    which should be 1.
%
%    Input, real P1(M1), the coefficients of the linear polynomial.
%    M1 = ( (D1+1)*(D1+2) ) / 2, which should be 3.
%
%    Input, integer N, the power to which the polynomial is to be raised.
%    0 <= N.
%
%    Output, integer D2, the degree of the power polyynomial, which
%    should be D2 = N * D1 = N.
%
%    Output, real P2(M2), the coefficients of the power polynomial.
%    M2 = ( (D2+1)*(D2+2) ) / 2, which should be ((N+1)*(N+2))/2.
%
  if ( d1 < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'POLY_POWER_LINEAR - Fatal error!\n' );
    fprintf ( 1, '  D1 < 0.\n' );
    error ( 'POLY_POWER_LINEAR - Fatal error!' )
  end

  if ( n < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'POLY_POWER_LINEAR - Fatal error!\n' );
    fprintf ( 1, '  N < 0.\n' );
    error ( 'POLY_POWER_LINEAR - Fatal error!' )
  end

  d2 = n * d1;
  m2 = ( ( d2 + 1 ) * ( d2 + 2 ) ) / 2;
  p2 = zeros ( m2, 1 );

  if ( d1 == 0 )
    p2(1) = p1(1) ^ n;
    return
  end

  if ( n == 0 )
    p2(1) = 1.0;
    return
  end
%
%  Use the Trinomial formula.
%
  for i = 0 : n
    for j = 0 : n - i
      for k = 0 : n - i - j
%
%  We store X^J Y^K in location L.
%
        l = pascal_to_i4 ( j, k );
        p2(l) = trinomial ( i, j, k ) * p1(1)^i * p1(2)^j * p1(3)^k;
      end
    end
  end

  return
end
