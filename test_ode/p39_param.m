function value = p39_param ( action, name, value )

%*****************************************************************************80
%
%% P39_PARAM defaults, sets, or gets the parameters for problem 39.
%
%  Discussion:
%
%    In typical use, the user calls
%      p39_param ( 'DEFAULT' )
%    Then, once the variables have been given default values, any 
%    value can be retrieved, as for example by:
%      value = p39_param ( 'GET', 'A' )
%    or set to a new value, as in:
%      p39_param ( 'SET', 'A', 2.0 )
%
%    A and B are the parameters in the right hand side:
%
%      y' = y*y - A * t + B
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string ACTION:
%    'DEFAULT' sets the variables to default values.  
%    'SET' sets the variable chosen by NAME to have the value VALUE.
%    'GET' gets the variable chosen by NAME.
%
%    Input, string NAME, the name of the variable, which should
%    be 'A' or 'B'.  NAME is ignored if the ACTION is 'DEFAULT'.
%
%    Input, real VALUE, the value to be assigned the variable NAME,
%    if the value of ACTION was 'SET'.  Otherwise VALUE is ignored.
%
%    Output, real VALUE, depends on the input value of ACTION:
%    'DEFAULT', returns the number of variables;
%    'SET', returns the input value of VALUE;
%    'GET', returns the value of the variable NAME.
%
  persistent a;
  persistent b;

  if ( s_eqi ( action, 'DEFAULT' ) )

    a = 1.0;
    b = 0.0;

    value = 2;

  elseif ( s_eqi ( action, 'SET' ) )

    if ( s_eqi ( name, 'A' ) )
      a = value;
    elseif ( s_eqi ( name, 'B' ) )
      b = value;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P39_PARAM - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized variable name: "%s".\n', name );
      error ( 'P39_PARAM - Fatal error!' );
    end

  elseif ( s_eqi ( action, 'GET' ) )

    if ( s_eqi ( name, 'A' ) )
      value = a;
    elseif ( s_eqi ( name, 'B' ) )
      value = b;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P39_PARAM - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized variable name: "%s".\n', name );
      error ( 'P39_PARAM - Fatal error!' );
    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P39_PARAM - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized action: "%s".\n', action );
    error ( 'P39_PARAM - Fatal error!' );

  end

  return
end
