function value = c8_asinh ( z )

%*****************************************************************************80
%
%% C8_ASINH evaluates the inverse hyperbolic sine of a C8.
%
%  Discussion:
%
%    Here we use the relationship:
%
%      C8_ASINH ( Z ) = - i * C8_ASIN ( i * Z ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, complex Z, the argument.
%
%    Output, complex VALUE, the function value.
%
  value = - i * c8_asin ( i * z );

  return
end
