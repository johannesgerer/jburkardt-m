function value = p40_param ( action, name, value )

%*****************************************************************************80
%
%% P40_PARAM defaults, sets, or gets the parameters for problem P40.
%
%  Discussion:
%
%    The ODE is
%
%      y' = y ( y - t ) / e
%
%    The parameter E may be controlled by this routine.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2013
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
  persistent e;
 
  if ( s_eqi ( action, 'DEFAULT' ) )

    e = 0.01;

    value = 1;

  elseif ( s_eqi ( action, 'SET' ) )

    if ( s_eqi ( name, 'E' ) )
      e = value;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P40_PARAM - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized variable name: "%s".\n', name );
      error ( 'P40_PARAM - Fatal error!' );
    end

  elseif ( s_eqi ( action, 'GET' ) )

    if ( s_eqi ( name, 'E' ) )
      value = e;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P40_PARAM - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized variable name: "%s".\n', name );
      error ( 'P40_PARAM - Fatal error!' );
    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P40_PARAM - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized action: "%s".\n', action );
    error ( 'P40_PARAM - Fatal error!' );

  end

  return
end
