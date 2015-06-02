function value = c8_sin ( z )

%*****************************************************************************80
%
%% C8_SIN evaluates the sine of a C8.
%
%  Discussion:
%
%    A C8 is a complex value.
%
%    We use the relationship:
%
%      C8_SIN ( C ) = - i * ( C8_EXP ( i * C ) - C8_EXP ( - i * C ) ) / 2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 February 2015
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
  value = - i * ( c8_exp ( i * z ) - c8_exp ( - i * z ) ) / 2.0;

  return
end
