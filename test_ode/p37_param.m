function value = p37_param ( action, name, value )

%*****************************************************************************80
%
%% P37_PARAM defaults, sets, or gets the parameters for problem 37.
%
%  Discussion:
%
%    In typical use, the user calls
%      p37_param ( 'DEFAULT' )
%    Then, once the variables have been given default values, any 
%    value can be retrieved, as for example by:
%      value = p37_param ( 'GET', 'A' )
%    or set to a new value, as in:
%      p37_param ( 'SET', 'A', 2.0 )
%
%    A is the amplitude on the forcing term;
%    K is the damping coefficient.
%    W is the frequency coefficient on the forcing term;
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
%    be 'A', 'K', or 'W'.  NAME is ignored if the ACTION is 'DEFAULT'.
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
  persistent k;
  persistent w;

  if ( s_eqi ( action, 'DEFAULT' ) )

    a = 0.3;
    k = 0.2;
    w = 1.0;

    value = 3;

  elseif ( s_eqi ( action, 'SET' ) )

    if ( s_eqi ( name, 'A' ) )
      a = value;
    elseif ( s_eqi ( name, 'K' ) )
      k = value;
    elseif ( s_eqi ( name, 'W' ) )
      w = value;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P37_PARAM - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized variable name: "%s".\n', name );
      error ( 'P37_PARAM - Fatal error!' );
    end

  elseif ( s_eqi ( action, 'GET' ) )

    if ( s_eqi ( name, 'A' ) )
      value = a;
    elseif ( s_eqi ( name, 'K' ) )
      value = k;
    elseif ( s_eqi ( name, 'W' ) )
      value = w;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P37_PARAM - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized variable name: "%s".\n', name );
      error ( 'P37_PARAM - Fatal error!' );
    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P37_PARAM - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized action: "%s".\n', action );
    error ( 'P37_PARAM - Fatal error!' );

  end

  return
end
