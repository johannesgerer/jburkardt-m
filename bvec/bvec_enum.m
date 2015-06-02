function value = bvec_enum ( n )

%*****************************************************************************80
%
%% BVEC_ENUM enumerates the binary vectors of length N.
%
%  Discussion:
%
%    A BVEC is a vector of binary digits representing an integer.
%
%    BVEC(1) is 0 for positive values and 1 for negative values, which
%    are stored in 2's complement form.
%
%    For positive values, BVEC(N) contains the units digit, BVEC(N-1)
%    the coefficient of 2, BVEC(N-2) the coefficient of 4 and so on,
%    so that printing the digits in order gives the binary form of the number.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the length of the vectors.
%
%    Output, integer BVEC_ENUM, the number of binary vectors.
%
  value = 2 ^ n;

  return
end
