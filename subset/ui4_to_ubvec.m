function bvec = ui4_to_ubvec ( i, n )

%*****************************************************************************80
%
%% UI4_TO_UBVEC makes a unsigned binary vector from an integer.
%
%  Discussion:
%
%    A UBVEC is an integer vector of binary digits, intended to
%    represent a nonnegative integer.  BVEC(1) is the units digit, BVEC(N)
%    is the coefficient of 2**(N-1).
%
%    To guarantee that there will be enough space for any
%    value of I, it would be necessary to set N = 32.
%
%  Example:
%
%     I       BVEC         binary
%    --  ----------------  ------
%     1  1, 0, 0, 0, 0, 0       1
%     2  0, 1, 0, 0, 0, 0      10
%     3  1, 1, 0, 0, 0, 0      11
%     4  0, 0, 1, 0, 0, 0     100
%     9  1, 0, 0, 1, 0, 0    1001
%    -9  1, 1, 1, 0, 1, 1  110111
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
%    Output, integer BVEC(N), the unsigned binary representation.
%
  base = 2;

  for j = 1 : n
    bvec(j) = mod ( i, base );
    i = floor ( i / base );
  end

  return
end
