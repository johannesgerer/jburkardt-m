function bvec2 = bvec_complement2 ( n, bvec1 )

%*****************************************************************************80
%
%% BVEC_COMPLEMENT2 computes the two's complement of a binary vector.
%
%  Discussion:
%
%    A BVEC is an integer vector of binary digits, intended to
%    represent an integer.  BVEC(1) is the units digit, BVEC(N-1)
%    is the coefficient of 2^(N-2), and BVEC(N) contains sign
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
%    Input, integer BVEC1(N), the vector to be complemented.
%
%    Output, integer BVEC2(N), the two's complemented vector.
%
  base = 2;

  bvec3(1:n) = ( base - 1 ) - bvec1(1:n);

  bvec4(1) = 1;
  bvec4(2:n) = 0;

  bvec2 = bvec_add ( n, bvec3, bvec4 );

  return
end
