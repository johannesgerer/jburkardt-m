function count = poly_coef_count ( dim, degree )

%*****************************************************************************80
%
%% POLY_COEF_COUNT: polynomial coefficient count given dimension and degree.
%
%  Discussion:
%
%    To count all monomials of degree 5 or less in dimension 3,
%    we can count all monomials of degree 5 in dimension 4.
%
%    To count all monomials of degree 5 in dimension 4, we imagine
%    that each of the variables X, Y, Z and W is a "box" and that
%    we need to drop 5 pebbles into these boxes.  Every distinct
%    way of doing this represents a degree 5 monomial in dimension 4.
%    Ignoring W gives us monomials up to degree five in dimension 3.
%
%    To count them, we draw 3 lines as separators to indicate the
%    4 boxes, and then imagine all disctinct sequences involving
%    the three lines and the 5 pebbles.  Indicate the lines by 1's
%    and the pebbles by 0's and we're asking for the number of
%    permutations of 3 1's and 5 0's, which is 8! / (3! 5!)
%
%    In other words, 56 = 8! / (3! 5!) is:
%    * the number of monomials of degree exactly 5 in dimension 4,
%    * the number of monomials of degree 5 or less in dimension 3,
%    * the number of polynomial coefficients of a polynomial of
%      degree 5 in (X,Y,Z).
%
%    In general, the formula for the number of monomials of degree DEG
%    or less in dimension DIM is
%
%      (DEG+DIM)! / (DEG! * DIM!)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM, the dimension of the polynomial.
%    0 <= DIM.
%
%    Input, integer DEGREE, the degree of the polynomnial
%    0 <= DEGREE
%
%    Output, integer COUNT, the number of coefficients
%    in the general polynomial of dimension DIM and degree DEGREE.
%
  if ( dim < 0 )
    count = -1;
  elseif ( degree < 0 )
    count = -1;
  else
    count = i4_choose ( degree + dim, degree );
  end

  return
end
