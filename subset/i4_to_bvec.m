function bvec = i4_to_bvec ( i, n )

%*****************************************************************************80
%
%% I4_TO_BVEC makes a signed binary vector from an integer.
%
%  Discussion:
%
%    A BVEC is an integer vector of binary digits, intended to
%    represent an integer.  BVEC(1) is the units digit, BVEC(N-1)
%    is the coefficient of 2**(N-2), and BVEC(N) contains sign
%    information.  It is 0 if the number is positive, and 1 if
%    the number is negative.
%
%    To guarantee that there will be enough space for any
%    value of I, it would be necessary to set N = 32.
%
%  Example:
%
%     I       BVEC         binary
%    --  ----------------  ------
%     1  1, 0, 0, 0, 0, 0      1
%     2  0, 1, 0, 0, 0, 0     10
%     3  1, 1, 0, 0, 0, 0     11
%     4  0, 0, 1, 0, 0, 0    100
%     9  1, 0, 0, 1, 0, 0   1001
%    -9  1, 1, 1, 0, 1, 1  -1001 = 110111 (2's complement)
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
%    Input, integer I, an integer to be represented.
%
%    Input, integer N, the dimension of the vector.
%
%    Output, integer BVEC(N), the signed binary representation.
%
  base = 2;
  i2 = abs ( i );

  for j = 1 : n-1
    bvec(j) = mod ( i2, base );
    i2 = floor ( i2 / base );
  end

  bvec(n) = 0;

  if ( i < 0 )
    bvec = bvec_complement2 ( n, bvec );
  end

  return
end
