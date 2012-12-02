function bvec2 = bvec_not ( n, bvec1 )

%*****************************************************************************80
%
%% BVEC_NOT "negates" or takes the 1's complement of a binary vector.
%
%  Discussion:
%
%    A BVEC is an integer vector of binary digits, intended to
%    represent an integer.  BVEC(1) is the units digit, BVEC(N-1)
%    is the coefficient of 2**(N-2), and BVEC(N) contains sign
%    information.  It is 0 if the number is positive, and 1 if
%    the number is negative.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 November 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the length of the vectors.
%
%    Input, integer BVEC1(N), the vector to be negated.
%
%    Output, integer BVEC2(N), the negated vector.
%
  base = 2;

  bvec2(1:n) = ( base - 1 ) - bvec1(1:n);

  return
end
