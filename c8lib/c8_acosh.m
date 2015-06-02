function value = c8_acosh ( z )

%*****************************************************************************80
%
%% C8_ACOSH evaluates the inverse hyperbolic cosine of a C8.
%
%  Discussion:
%
%    A C8 is a complex value.
%
%    Here we use the relationship:
%
%      C8_ACOSH ( Z ) = i * C8_ACOS ( Z ).
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
%    Input, complex Z, the argument.
%
%    Output, complex VALUE, the function value.
%
  value = i * c8_acos ( z );

  return
end
