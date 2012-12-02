function value = ubvec_to_ui4 ( n, bvec )

%*****************************************************************************80
%
%% UBVEC_TO_UI4 makes an unsigned integer from an unsigned binary vector.
%
%  Discussion:
%
%    A UBVEC is an integer vector of binary digits, intended to
%    represent a nonnegative integer.  BVEC(1) is the units digit, BVEC(N)
%    is the coefficient of 2**(N-1).
%
%  Example:
%
%    N = 4
%
%         BVEC   binary  I
%    ----------  -----  --
%    1  2  3  4
%    ----------
%    1, 0, 0, 0       1  1
%    0, 1, 0, 0      10  2
%    0, 0, 1, 1      11  3
%    0, 0, 1, 0     100  4
%    1, 0, 0, 1    1001  9
%    1, 1, 1, 1    1111 15
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
%    Input, integer N, the dimension of the vector.
%
%    Input, integer BVEC(N), the binary representation.
%
%    Output, integer VALUE, the integer.
%
  base = 2;

  value = 0;
  for j = n : -1 : 1
    value = base * value + bvec(j);
  end

  return
end
