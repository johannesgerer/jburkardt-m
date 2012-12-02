function [ rexp, sexp ] = poly_q4 ( )

%*****************************************************************************80
%
%% POLY_Q4 returns the monomials associated with a 4 node quadrilateral.
%
%  Reference Element Q4:
%
%    |
%    1  4-----3
%    |  |     |
%    |  |     |
%    S  |     |
%    |  |     |
%    |  |     |
%    0  1-----2
%    |
%    +--0--R--1-->
%
%  Formula:
%
%    Given coefficients A(I), the polynomial interpolant at (R,S) is
%
%      P(R,S) = sum ( 1 <= I <= N ) A(I) * R**REXP(I) * S**SEXP(I)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, integer REXP(4), SEXP(4), the powers of R and S associated
%    with each polynomial.
%
  rexp(1:4) = [ 0, 0, 1, 1 ];
  sexp(1:4) = [ 0, 1, 0, 1 ];

  return
end
