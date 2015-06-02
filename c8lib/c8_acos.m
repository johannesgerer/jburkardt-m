function value = c8_acos ( c )

%*****************************************************************************80
%
%% C8_ACOS evaluates the inverse cosine of a C8.
%
%  Discussion:
%
%    Here we use the relationship:
%
%      C8_ACOS ( Z ) = pi/2 - C8_ASIN ( Z ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, complex C, the argument.
%
%    Output, complex C8_ACOS, the function value.
%
  value = 0.5 * pi - c8_asin ( c );

  return
end
