function [ rexp, sexp ] = poly_q16 ( )

%*****************************************************************************80
%
%% POLY_Q16 returns the monomials associated with a 16 node quadrilateral.
%
%  Reference Element Q16:
%
%    |
%    1 13--14--15--16
%    |  |   :   :   |
%    |  |   :   :   |
%    |  9..10..11..12
%    S  |   :   :   |
%    |  |   :   :   |
%    |  5...6...7...8
%    |  |   :   :   |
%    |  |   :   :   |
%    0  1---2---3---4
%    |
%    +--0-----R-----1-->
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
%    Output, integer REXP(16), SEXP(16), the powers of R and S associated
%    with each monomial.
%
  rexp(1:16) = [ 0, 0, 1, 0, 1, 2, 0, 1, 2, 3, 1, 2, 3, 2, 3, 3 ];
  sexp(1:16) = [ 0, 1, 0, 2, 1, 0, 3, 2, 1, 0, 3, 2, 1, 3, 2, 3 ];

  return
end
