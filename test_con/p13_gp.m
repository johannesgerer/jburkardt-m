function value = p13_gp ( option, u )

%*****************************************************************************80
%
%% P13_GP evaluates the derivative of the right hand side function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Input, real U, the value of the argument.
%
%    Output, real VALUE, the derivative of the right hand side function
%    at U.
%
  if ( option == 1 | option == 3 | option == 5 )
    value = exp ( u );
  elseif ( option == 2 | option == 4 | option == 6 )
    value = ( 1.0 + u - 0.01 * u * u ) / ( 1.0 + 0.01 * u * u )^2;
  end

  return
end
