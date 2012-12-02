function [ rexp, sexp ] = poly_q8 ( )

%*****************************************************************************80
%
%% POLY_Q8 returns the monomials associated with an 8 node quadrilateral.
%
%  Reference Element Q8:
%
%    |
%    1  4--7--3
%    |  |     |
%    |  |     |
%    S  8     6
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
%    Output, integer REXP(8), SEXP(8), the powers of R and S associated
%    with each monomial.
%
  rexp(1:8) = [ 0, 0, 1, 0, 1, 2, 1, 2 ];
  sexp(1:8) = [ 0, 1, 0, 2, 1, 0, 2, 1 ];

  return
end
