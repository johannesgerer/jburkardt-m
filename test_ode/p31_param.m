function value = p31_param ( action, name, value )

%*****************************************************************************80
%
%% P31_PARAM defaults, sets, or gets the parameters for problem 31.
%
%  Discussion:
%
%    In typical use, the user calls
%      p31_param ( 'DEFAULT' )
%    Then, once the variables have been given default values, any 
%    value can be retrieved, as for example by:
%      value = p31_param ( 'GET', 'A' )
%    or set to a new value, as in:
%      p31_param ( 'SET', 'A', 1 )
%
%    A, B, C, and D are the positive coefficients in the equations:
%
%    Y1' = ( A - B * Y2 ) * Y1
%    Y2' = ( C * Y1 - D ) * Y2
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
%    be 'A', 'B', 'C', 'D'.  NAME is ignored if the ACTION is 'DEFAULT'.
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
  persistent c;
  persistent d;

  if ( s_eqi ( action, 'DEFAULT' ) )

    a = 5.0;
    b = 1.0;
    c = 0.5;
    d = 2.0;

    value = 4;

  elseif ( s_eqi ( action, 'SET' ) )

    if ( s_eqi ( name, 'A' ) )
      a = value;
    elseif ( s_eqi ( name, 'B' ) )
      b = value;
    elseif ( s_eqi ( name, 'C' ) )
      c = value;
    elseif ( s_eqi ( name, 'D' ) )
      d = value;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P31_PARAM - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized variable name: "%s".\n', name );
      error ( 'P31_PARAM - Fatal error!' );
    end

  elseif ( s_eqi ( action, 'GET' ) )

    if ( s_eqi ( name, 'A' ) )
      value = a;
    elseif ( s_eqi ( name, 'B' ) )
      value = b;
    elseif ( s_eqi ( name, 'C' ) )
      value = c;
    elseif ( s_eqi ( name, 'D' ) )
      value = d;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P31_PARAM - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized variable name: "%s".\n', name );
      error ( 'P31_PARAM - Fatal error!' );
    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P31_PARAM - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized action: "%s".\n', action );
    error ( 'P31_PARAM - Fatal error!' );

  end

  return
end
