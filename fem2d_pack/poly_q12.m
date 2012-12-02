function [ rexp, sexp ] = poly_q12 ( )

%*****************************************************************************80
%
%% POLY_Q12 returns the monomials associated with a 12 node quadrilateral.
%
%  Reference Element Q12:
%
%    |
%    1  9-10-11-12
%    |  |        |
%    |  7        8
%    S  |        |
%    |  5        6
%    |  |        |
%    0  1--2--3--4
%    |
%    +--0---R---1-->
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
%    14 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, integer REXP(12), SEXP(12), the powers of R and S associated
%    with each monomial.
%
  rexp(1:12) = [ 0, 0, 1, 0, 1, 2, 0, 1, 2, 3, 1, 3 ];
  sexp(1:12) = [ 0, 1, 0, 2, 1, 0, 3, 2, 1, 0, 3, 1 ];

  return
end
