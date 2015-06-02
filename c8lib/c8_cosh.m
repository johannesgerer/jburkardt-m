function value = c8_cosh ( z )

%*****************************************************************************80
%
%% C8_COSH evaluates the hyperbolic cosine of a C8.
%
%  Discussion:
%
%    A C8 is a complex value.
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
%    Input, complex Z, the argument.
%
%    Output, complex VALUE, the function value.
%
  value = ( c8_exp ( z ) + c8_exp ( - z ) ) / 2.0;

  return
end