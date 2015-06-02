function value = fu_integral ( d )

%*****************************************************************************80
%
%% FU_INTEGRAL returns the integral of the test function for [0,1]^D.
%
%  Discussion:
%
%    The same function, integrated over [-1,+1]^D, has an integral that
%    is a factor of 2^D times as large as this result.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 May 2012
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
  value = ( 0.5 * erf ( 0.5 / sqrt ( 2.0 ) ) ) .^ d;

  return
end
