function [ rexp, sexp ] = poly_t10 ( )

%*****************************************************************************80
%
%% POLY_T10 returns the monomials associated with a 10 node triangle.
%
%  Reference Element T10:
%
%    |
%    1  10
%    |  |\
%    |  | \
%    |  8  9
%    |  |   \
%    S  |    \
%    |  5  6  7
%    |  |      \
%    |  |       \
%    0  1--2--3--4
%    |
%    +--0----R---1-->
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
%    Output, integer REXP(10), SEXP(10), the powers of R and S associated
%    with each monomial.
%
  rexp(1:10) = [ 0, 0, 1, 0, 1, 2, 0, 1, 2, 3 ];
  sexp(1:10) = [ 0, 1, 0, 2, 1, 0, 3, 2, 1, 0 ];

  return
end
