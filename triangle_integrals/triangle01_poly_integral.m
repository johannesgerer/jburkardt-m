function q = triangle01_poly_integral ( d, p )

%*****************************************************************************80
%
%% TRIANGLE01_POLY_INTEGRAL: polynomial integral over the unit triangle.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/triangle01_poly_integral.m
%
%  Discussion:
%
%    The unit triangle is T = ( (0,0), (1,0), (0,1) ).
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
%    Output, real Q, the integral.
%
  m = ( ( d + 1 ) * ( d + 2 ) ) / 2;

  q = 0.0;
  for k = 1 : m
    [ i, j ] = i4_to_pascal ( k );
    qk = triangle01_monomial_integral ( i, j );
    q = q + p(k) * qk;
  end

  return
end
