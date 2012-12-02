function [ rexp, sexp ] = poly_t3 ( )

%*****************************************************************************80
%
%% POLY_T3 returns the monomials associated with a 3 node triangle.
%
%  Reference Element T3:
%
%    |
%    1  3
%    |  |\
%    |  | \
%    S  |  \
%    |  |   \
%    |  |    \
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
%    Output, integer REXP(N), SEXP(N), the powers of R and S associated
%    with each monomial.
%
  rexp(1:3) = [ 0, 0, 1 ];
  sexp(1:3) = [ 0, 1, 0 ];

  return
end
