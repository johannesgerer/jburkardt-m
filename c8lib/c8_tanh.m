function value = c8_tanh ( z )

%*****************************************************************************80
%
%% C8_TANH evaluates the hyperbolic tangent of a C8.
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
  value = ( c8_exp ( z ) - c8_exp ( - z ) ) / ( c8_exp ( z ) + c8_exp ( - z ) );

  return
end
