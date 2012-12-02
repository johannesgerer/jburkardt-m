function value = p34_param ( action, name, value )

%*****************************************************************************80
%
%% P34_PARAM defaults, sets, or gets the parameters for problem 34.
%
%  Discussion:
%
%    In typical use, the user calls
%      p34_param ( 'DEFAULT' )
%    Then, once the variables have been given default values, any 
%    value can be retrieved, as for example by:
%      value = p34_param ( 'GET', 'G' )
%    or set to a new value, as in:
%      p34_param ( 'SET', 'G', 1 )
%
%    G is the gravitational force;
%    K is the damping coefficient;
%    L is the length of the string;
%    M is the mass of the pendulum bob.
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
%    be 'G', 'K', 'L', 'M'.  NAME is ignored if the ACTION is 'DEFAULT'.
%
%    Input, real VALUE, the value to be assigned the variable NAME,
%    if the value of ACTION was 'SET'.  Otherwise VALUE is ignored.
%
%    Output, real VALUE, depends on the input value of ACTION:
%    'DEFAULT', returns the number of variables;
%    'SET', returns the input value of VALUE;
%    'GET', returns the value of the variable NAME.
%
  persistent g;
  persistent k;
  persistent l;
  persistent m;

  if ( s_eqi ( action, 'DEFAULT' ) )

    g = 32.0;
    k = 1.0;
    l = 1.0;
    m = 1.0;

    value = 4;

  elseif ( s_eqi ( action, 'SET' ) )

    if ( s_eqi ( name, 'G' ) )
      g = value;
    elseif ( s_eqi ( name, 'K' ) )
      k = value;
    elseif ( s_eqi ( name, 'L' ) )
      l = value;
    elseif ( s_eqi ( name, 'M' ) )
      m = value;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P34_PARAM - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized variable name: "%s".\n', name );
      error ( 'P34_PARAM - Fatal error!' );
    end

  elseif ( s_eqi ( action, 'GET' ) )

    if ( s_eqi ( name, 'G' ) )
      value = g;
    elseif ( s_eqi ( name, 'K' ) )
      value = k;
    elseif ( s_eqi ( name, 'L' ) )
      value = l;
    elseif ( s_eqi ( name, 'M' ) )
      value = m;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P34_PARAM - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized variable name: "%s".\n', name );
      error ( 'P34_PARAM - Fatal error!' );
    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P34_PARAM - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized action: "%s".\n', action );
    error ( 'P34_PARAM - Fatal error!' );

  end

  return
end
