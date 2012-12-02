function value = p21_r8 ( action, name, value )

%*****************************************************************************80
%
%% P21_R8 sets or gets R8 parameters for problem 21.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string ACTION,
%    'D' sets the parameter to its default value;
%    'G' gets a parameter.
%    'R' sets the parameter to a random value.
%    'S' sets a parameter,
%
%    Input, string NAME, the name of the parameter.
%    'C' is the coefficient.
%
%    Input/output, real VALUE.
%    * If ACTION = 'S', then VALUE is an input quantity, and is the
%      new value to be assigned to NAME.
%    * If ACTION = 'G' or 'R', then VALUE is an output quantity, 
%      and is the current value of NAME.
%
  persistent c;

  if ( action == 'D' | action == 'd' )

    if ( name == 'C' | name == 'c' | name == '*' )
      c = 1.0;
    end

  elseif ( action == 'G' | action == 'g' )

    if ( name == 'C' | name == 'c' )
      value = c;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P21_R8 - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized name = "%s".\n', name );
      error ( 'P21_R8 - Fatal error!' );
    end

  elseif ( action == 'R' | action == 'r' )

    if ( name == 'C' | name == 'c' )
      c = rand ( 1, 1 );
      value = c;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P21_R8 - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized name = "%s".\n', name );
      error ( 'P21_R8 - Fatal error!' );
    end

  elseif ( action == 'S' | action == 's' )

    if ( name == 'C' | name == 'c' )
      c = value;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P21_R8 - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized name = "%s".\n', name );
      error ( 'P21_R8 - Fatal error!' );
    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P21_R8 - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized action = "%s".\n', action );
    error ( 'P21_R8 - Fatal error!' );

  end

  return
end
