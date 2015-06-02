function bvec3 = bvec_sub ( n, bvec1, bvec2 )

%*****************************************************************************80
%
%% BVEC_SUB subtracts two binary vectors.
%
%  Discussion:
%
%    A BVEC is an integer vector of binary digits, intended to
%    represent an integer.  BVEC(1) is the units digit, BVEC(N-1)
%    is the coefficient of 2^(N-2), and BVEC(N) contains sign
%    information.  It is 0 if the number is positive, and 1 if
%    the number is negative.
%
%  Example:
%
%    N = 4
%
%    BVEC1    dec  BVEC2    dec  BVEC3    dec
%    -------  ---  -------  ---  -------  ---
%    0 0 1 0   4   1 0 0 0   1   1 1 0 0   3
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
%    Input, integer BVEC1(N), BVEC2(N), the vectors to be subtracted.
%
%    Output, integer BVEC3(N), the value of BVEC1 - BVEC2.
%
  bvec4(1:n) = bvec_complement2 ( n, bvec2 );

  bvec3 = bvec_add ( n, bvec1, bvec4 );

  return
end
