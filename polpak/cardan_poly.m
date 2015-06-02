function cx = cardan_poly ( n, x, s )

%*****************************************************************************80
%
%% CARDAN_POLY evaluates the Cardan polynomials.
%
%  First terms:
%
%     N  C(N,S,X)
%
%     0  2
%     1  X
%     2  X^2  -  2 S
%     3  X^3  -  3 S X
%     4  X^4  -  4 S X^2 +  2 S^2
%     5  X^5  -  5 S X^3 +  5 S^2 X
%     6  X^6  -  6 S X^4 +  9 S^2 X^2 -  2 S^3
%     7  X^7  -  7 S X^5 + 14 S^2 X^3 -  7 S^3 X
%     8  X^8  -  8 S X^6 + 20 S^2 X^4 - 16 S^3 X^2 +  2 S^4
%     9  X^9  -  9 S X^7 + 27 S^2 X^5 - 30 S^3 X^3 +  9 S^4 X
%    10  X^10 - 10 S X^8 + 35 S^2 X^6 - 50 S^3 X^4 + 25 S^4 X^2 -  2 S^5
%    11  X^11 - 11 S X^9 + 44 S^2 X^7 - 77 S^3 X^5 + 55 S^4 X^3 - 11 S^5 X
%
%  Recursion:
%
%    Writing the N-th polynomial in terms of its coefficients:
%
%      C(N,S,X) = sum ( 0 <= I <= N ) D(N,I) * S^(N-I)/2 * X^I
%
%    then
%
%    D(0,0) = 1
%
%    D(1,1) = 1
%    D(1,0) = 0
%
%    D(N,N) = 1
%    D(N,K) = D(N-1,K-1) - D(N-2,K)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Thomas Osler,
%    Cardan Polynomials and the Reduction of Radicals,
%    Mathematics Magazine, 
%    Volume 74, Number 1, February 2001, pages 26-32.
%
%  Parameters:
%
%    Input, integer N, the highest polynomial to compute.
%
%    Input, real X, the point at which the polynomials are to be computed.
%
%    Input, real S, the value of the parameter, which must be positive.
%
%    Output, real CX(1:N+1), the values of the Cardan polynomials at X.
%
  s2 = sqrt ( s );
  x2 = 0.5 * x / s2;

  cx = cheby_t_poly ( 1, n, x2 );

  fact = 1.0;

  for i = 0 : n
    cx(i+1) = 2.0 * fact * cx(i+1);
    fact = fact * s2;
  end
 
  return
end
