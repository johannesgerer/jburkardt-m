function value = p16_param ( action, name, value )

%*****************************************************************************80
%
%% P16_PARAM defaults, sets, or gets the parameters for problem 16.
%
%  Discussion:
%
%    In typical use, the user calls
%      p16_param ( 'DEFAULT' )
%    Then, once the variables have been given default values, any 
%    value can be retrieved, as for example by:
%      value = p16_param ( 'GET', 'DELTA' )
%    or set to a new value, as in:
%      p16_param ( 'SET', 'DELTA', 7 )
%
%    DELTA is the only parameter.
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
%    be 'DELTA'.  NAME is ignored if the ACTION is 'DEFAULT'.
%
%    Input, real VALUE, the value to be assigned the variable NAME,
%    if the value of ACTION was 'SET'.  Otherwise VALUE is ignored.
%
%    Output, real VALUE, depends on the input value of ACTION:
%    'DEFAULT', returns the number of variables;
%    'SET', returns the input value of VALUE;
%    'GET', returns the value of the variable NAME.
%
  persistent delta;

  if ( s_eqi ( action, 'DEFAULT' ) )

    delta = 0.1;

    value = 1;

  elseif ( s_eqi ( action, 'SET' ) )

    if ( s_eqi ( name, 'DELTA' ) )
      delta = value;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P16_PARAM - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized variable name: "%s".\n', name );
      error ( 'P16_PARAM - Fatal error!' );
    end

  elseif ( s_eqi ( action, 'GET' ) )

    if ( s_eqi ( name, 'DELTA' ) )
      value = delta;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P16_PARAM - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized variable name: "%s".\n', name );
      error ( 'P16_PARAM - Fatal error!' );
    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P16_PARAM - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized action: "%s".\n', action );
    error ( 'P16_PARAM - Fatal error!' );

  end

  return
end
