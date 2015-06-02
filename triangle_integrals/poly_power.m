function [ d2, p2 ] = poly_power ( d1, p1, n )

%*****************************************************************************80
%
%% POLY_POWER computes a power of a polynomial.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/poly_power.m
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
%    Input, integer D1, the degree of the polynomial.
%
%    Input, real P1(M1), the polynomial coefficients.
%    M1 = ((D1+1)*(D1+2))/2.
%
%    Input, integer N, the nonnegative integer power.
%
%    Output, integer D2, the degree of the power polynomial.
%    D2 = N * D1.
%
%    Output, real P2(M2), the polynomial power.
%    M2 = ((D2+1)*(D2+2))/2.
%

%
%  Create P2, a polynomial representation of 1.
%
  d2 = 0;
  m2 = ( ( d2 + 1 ) * ( d2 + 2 ) ) / 2;
  p2 = zeros ( m2, 1 );
  p2(1) = 1.0;
%
%  Iterate N times:
%    P2 <= P2 * P1
%
  for i = 1 : n
    [ d2, p2 ] = poly_product ( d2, p2, d1, p1 );
  end

  return
end
