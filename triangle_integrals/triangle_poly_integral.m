function q = triangle_poly_integral ( d, p, t )

%*****************************************************************************80
%
%% TRIANGLE_POLY_INTEGRAL: polynomial integral over a triangle.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/triangle_poly_integral.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer D, the degree of the polynomial.
%
%    Input, real P(M), the polynomial coefficients.
%    M = ((D+1)*(D+2))/2.
%
%    Input, real T(2,3), the vertices of the triangle.
%
%    Output, real Q, the integral.
%
  m = ( ( d + 1 ) * ( d + 2 ) ) / 2;

  q = 0.0;
  for k = 1 : m
    [ i, j ] = i4_to_pascal ( k );
    qk = triangle_monomial_integral ( i, j, t );
    q = q + p(k) * qk;
  end

  return
end
