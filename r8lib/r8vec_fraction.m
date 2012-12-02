function fraction = r8vec_fraction ( n, x )

%*****************************************************************************80
%
%% R8VEC_FRACTION returns the fraction parts of an R8VEC.
%
%  Discussion:
%
%    An R8VEC is an array of R8's.
%
%    If we regard a real number as
%
%      R8 = SIGN * ( WHOLE + FRACTION )
%
%    where
%
%      SIGN is +1 or -1,
%      WHOLE is a nonnegative integer
%      FRACTION is a nonnegative real number strictly less than 1,
%
%    then this routine returns the value of FRACTION.
%
%  Example:
%
%     R8    R8_FRACTION
%
%    0.00      0.00
%    1.01      0.01
%    2.02      0.02
%   19.73      0.73
%   -4.34      0.34
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of arguments.
%
%    Input, real X(N), the arguments.
%
%    Output, real FRACTION(N), the fraction parts.
%
  fraction(1:n) = abs ( x(1:n) ) - floor ( abs ( x(1:n) ) );

  return
end
