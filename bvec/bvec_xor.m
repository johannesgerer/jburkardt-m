function bvec3 = bvec_xor ( n, bvec1, bvec2 )

%*****************************************************************************80
%
%% BVEC_XOR computes the exclusive OR of two binary vectors.
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
%    Input, integer BVEC1(N), BVEC2(N), the binary vectors to be XOR'ed.
%
%    Input, integer BVEC3(N), the exclusive OR of the two vectors.
%
  bvec3(1:n) = mod ( bvec1(1:n) + bvec2(1:n), 2 );

  return
end
