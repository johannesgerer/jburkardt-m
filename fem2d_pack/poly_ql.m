function [ rexp, sexp ] = poly_ql ( )

%*****************************************************************************80
%
%% POLY_QL returns the monomials for a quadratic/linear quadrilateral.
%
%  Reference Element QL:
%
%    |
%    1  4---5---6
%    |  |       |
%    |  |       |
%    S  |       |
%    |  |       |
%    |  |       |
%    0  1---2---3
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
  rexp(1:6) = [ 0, 0, 1, 1, 2, 2 ];
  sexp(1:6) = [ 0, 1, 0, 1, 0, 1 ];

  return
end
