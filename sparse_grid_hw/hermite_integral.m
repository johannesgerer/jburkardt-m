function value = hermite_integral ( d )

%*****************************************************************************80
%
%% HERMITE_INTEGRAL returns the value of a Hermite integral.
%
%  Discussion:
%
%      value = integral ( -oo < x < +oo ) sqrt ( 1 + x'x ) exp(-x'x/2) dx
%
%    where x is a D-dimensional variable.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer D, the spatial dimension.
%
%    Output, real VALUE, the value of the integral.
%
  value = 3.3953052183847970083 / sqrt ( 2.0 * pi );

  return
end
