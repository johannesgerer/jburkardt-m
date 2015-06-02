function [ bvec3, overflow ] = bvec_add ( n, bvec1, bvec2 )

%*****************************************************************************80
%
%% BVEC_ADD adds two binary vectors.
%
%  Discussion:
%
%    A BVEC is an integer vector of binary digits, intended to
%    represent an integer.  BVEC(1) is the units digit, BVEC(N-1)
%    is the coefficient of 2**(N-2), and BVEC(N) contains sign
%    information.  It is 0 if the number is positive, and 1 if
%    the number is negative.
%
%  Example:
%
%    N = 4
%
%    BVEC1    dec  BVEC2    dec  BVEC3    dec
%    -------  ---  -------  ---  -------  ---
%    1 0 0 0   1   1 1 0 0   3   0 0 1 0   4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the length of the vectors.
%
%    Input, integer BVEC1(N), BVEC2(N), the vectors to be added.
%
%    Output, integer BVEC3(N), the sum of the two input vectors.
%
%    Output, logical OVERFLOW, is true if the sum overflows.
%
  base = 2;
  overflow = 0;

  bvec3(1:n) = floor ( bvec1(1:n) ) + floor ( bvec2(1:n) );

  for i = 1 : n
    while ( base <= bvec3(i) )
      bvec3(i) = bvec3(i) - base;
      if ( i < n )
        bvec3(i+1) = bvec3(i+1) + 1;
      else
        overflow = 1;
      end
    end
  end

  return
end
