function value = c8_cos ( c )

%*****************************************************************************80
%
%% C8_COS evaluates the cosine of a C8.
%
%  Discussion:
%
%    A C8 is a complex value.
%
%    We use the relationship:
%
%      C8_COS ( C ) = ( C8_EXP ( i * C ) + C8_EXP ( - i * C ) ) / 2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, complex C, the argument.
%
%    Output, complex VALUE, the function value.
%
  value = ( c8_exp ( i * c ) + c8_exp ( - i * c ) ) / 2.0;

  return
end
