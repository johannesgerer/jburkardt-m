function [ d3, p3 ] = poly_product ( d1, p1, d2, p2 )

%*****************************************************************************80
%
%% POLY_PRODUCT computes P3(x,y) = P1(x,y) * P2(x,y) for polynomials.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/poly_product.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer D1, the degree of factor 1.
%
%    Input, real P1(M1), the factor 1 coefficients.
%    M1 = ((D1+1)*(D1+2))/2.
%
%    Input, integer D2, the degree of factor 2.
%
%    Input, real P2(M2), the factor2 coefficients.
%    M2 = ((D2+1)*(D2+2))/2.
%
%    Output, integer D3, the degree of the result.
%
%    Output, real P3(M3), the result coefficients.
%    M3 = ((D3+1)*(D3+2))/2.
%
  d3 = d1 + d2;
  m3 = ( ( d3 + 1 ) * ( d3 + 2 ) ) / 2;
  p3 = zeros ( m3, 1 );
%
%  Consider each entry in P1:
%    P1(K1) * X^I1 * Y^J1
%  and multiply it by each entry in P2:
%    P2(K2) * X^I2 * Y^J2
%  getting 
%    P3(K3) = P3(K3) + P1(K1) * P2(X2) * X^(I1+I2) * Y(J1+J2)
%
  m1 = ( ( d1 + 1 ) * ( d1 + 2 ) ) / 2;
  m2 = ( ( d2 + 1 ) * ( d2 + 2 ) ) / 2;

  for k1 = 1 : m1
    [ i1, j1 ] = i4_to_pascal ( k1 );
    for k2 = 1 : m2
      [i2, j2 ] = i4_to_pascal ( k2 );
      i3 = i1 + i2;
      j3 = j1 + j2;
      k3 = pascal_to_i4 ( i3, j3 );
      p3(k3) = p3(k3) + p1(k1) * p2(k2);
    end
  end

  return
end
