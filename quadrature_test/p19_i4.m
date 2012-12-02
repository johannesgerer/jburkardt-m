function value = p19_i4 ( action, name, value )

%*****************************************************************************80
%
%% P19_I4 sets or gets I4 parameters for problem 19.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string ACTION,
%    'D' to set a parameter to its default value.
%    'S' to set a parameter,
%    'G' to get a parameter,
%    'I' to increment a parameter.
%
%    Input, string NAME, the name of the variable.
%    '#' is the number of calls to the integrand routine.
%
%    Input/output, integer VALUE.
%    * If ACTION = 'I', then VALUE is an input quantity, and is the
%      new value to be added to NAME.
%    * If ACTION = 'S', then VALUE is an input quantity, and is the
%      new value to be assigned to NAME.
%    * If ACTION = 'G', then VALUE is an output quantity, and is the
%      current value of NAME.
%
  persistent calls;

  if ( action == 'D' | action == 'd' )

    if ( name == '#' | name == '*' )
      calls = 0;
    end

  elseif ( action == 'G' | action == 'g' )

    if ( name == '#' )
      value = calls;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P19_I4 - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized name = "%s".\n', name );
      error ( 'P19_I4 - Fatal error!' );
    end

  elseif ( action == 'I' | action == 'i' )

    if ( name == '#' )
      calls = calls + value;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P19_I4 - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized name = "%s".\n', name );
      error ( 'P19_I4 - Fatal error!' );
    end

  elseif ( action == 'S' | action == 's' )

    if ( name == '#' )
      calls = value;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P19_I4 - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized name = "%s".\n', name );
      error ( 'P19_I4 - Fatal error!' );
    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P19_I4 - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized action = "%s".\n', action );
    error ( 'P19_I4 - Fatal error!' );

  end

  return
end
