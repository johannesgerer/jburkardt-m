function value = bvec_to_i4 ( n, bvec )

%*****************************************************************************80
%
%% BVEC_TO_I4 makes an integer from a (signed) binary vector.
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
%         BVEC   binary  I
%    ----------  -----  --
%    1  2  3  4
%    ----------
%    1, 0, 0, 0       1  1
%    0, 1, 0, 0      10  2
%    0, 0, 1, 1    -100 -4
%    0, 0, 1, 0     100  4
%    1, 0, 0, 1    -111 -9
%    1, 1, 1, 1      -0  0
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
%    Input, integer N, the dimension of the vector.
%
%    Input, integer BVEC(N), the binary representation.
%
%    Output, integer VALUE, the integer.
%
  base = 2;
  bvec2(1:n) = bvec(1:n);

  i_sign = 1;

  if ( bvec2(n) == base - 1 )
    i_sign = -1;
    bvec2(1:n-1) = bvec_complement2 ( n-1, bvec2 );
  end

  value = 0;
  for j = n-1 : -1 : 1
    value = base * value + bvec2(j);
  end

  value = i_sign * value;

  return
end
