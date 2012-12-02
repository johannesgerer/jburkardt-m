function [ rexp, sexp ] = poly_q9 ( )

%*****************************************************************************80
%
%% POLY_Q9 returns the monomials associated with a 9 node quadrilateral.
%
%  Reference Element Q9:
%
%    |
%    1  4--7--3
%    |  |     |
%    |  |     |
%    S  8  9  6
%    |  |     |
%    |  |     |
%    0  1--5--2
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
%    Output, integer REXP(9), SEXP(9), the powers of R and S associated
%    with each monomial.
%
  rexp(1:9) = [ 0, 0, 1, 0, 1, 2, 1, 2, 2 ];
  sexp(1:9) = [ 0, 1, 0, 2, 1, 0, 2, 1, 2 ];

  return
end
