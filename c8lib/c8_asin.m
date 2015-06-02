function value = c8_asin ( z )

%*****************************************************************************80
%
%% C8_ASIN evaluates the inverse sine of a C8.
%
%  Discussion:
%
%    A C8 is a complex value.
%
%    Here we use the relationship:
%
%      C8_ASIN ( Z ) = - i * log ( i * z + sqrt ( 1 - z * z ) )
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
  value = - i * log ( i * z + sqrt ( 1.0 - z * z ) );

  return
end
