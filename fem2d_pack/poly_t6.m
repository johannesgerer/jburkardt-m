function [ rexp, sexp ] = poly_t6 ( )

%*****************************************************************************80
%
%% POLY_T6 returns the monomials associated with a 6 node triangle.
%
%  Reference Element T6:
%
%    |
%    1  3
%    |  |\
%    |  | \
%    S  6  5
%    |  |   \
%    |  |    \
%    0  1--4--2
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
%    Output, integer REXP(6), SEXP(6), the powers of R and S associated
%    with each monomial.
%
  rexp(1:6) = [ 0, 0, 1, 0, 1, 2 ];
  sexp(1:6) = [ 0, 1, 0, 2, 1, 0 ];

  return
end
