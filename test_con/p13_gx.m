function value = p13_gx ( option, u )

%*****************************************************************************80
%
%% P13_GX evaluates the right hand side function.
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
%    Output, real VALUE, the right hand side function at U.
%
  if ( option == 1 | option == 3 | option == 5 )
    value = exp ( u );
  elseif ( option == 2 | option == 4 | option == 6 )
    value = ( 100.0 + 100.0 * u + 51.0 * u * u ) / ( 100.0 + u * u );
  end

  return
end
