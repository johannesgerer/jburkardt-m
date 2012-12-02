function value = fn_integral ( d )

%*****************************************************************************80
%
%% FN_INTEGRAL returns the integral of the Hermite test function.
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
  exponent = 6;

  value = i4_factorial2 ( exponent - 1 );

  return
end
