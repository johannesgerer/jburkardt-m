function value = p20_r8_store ( action, name, value )

%*****************************************************************************80
%
%% P20_R8_STORE sets or gets the value of a real parameter for problem 20.
%
%  Discussion:
%
%    The only legal input name is 'hold_value', which indicates the
%    value of the variable to be held fixed.  This variable is given
%    the default value of pi/8.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string ACTION, either 'get' or 'set'.
%
%    Input, string NAME, the name of the variable.
%
%    Input, real VALUE, the value of the variable to be set, 
%    if ACTION is 'set'.
%
%    Output, real VALUE, the value of the variable to get,
%    if ACTION is 'get'
%
  persistent hold_value;

  if ( s_eqi ( action, 'get' ) )

    if ( isempty ( hold_value ) )
      hold_value = 0.39269908169872415481;
    end 

    if ( s_eqi ( name, 'hold_value' ) )
      value = hold_value;
    else
      value = [];
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P20_R8_STORE - Fatal error!\n' );
      fprintf ( 1, '  Unexpected "get" of NAME = "%s".\n', name );
      error ( 'P20_R8_STORE - Fatal error!' );
    end

  else if ( s_eqi ( action, 'set' ) )

    if ( s_eqi ( name, 'hold_value' ) )
      hold_value = value;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P20_R8_STORE - Fatal error!\n' );
      fprintf ( 1, '  Unexpected "set" of NAME = "%s".\n', name );
      error ( 'P20_R8_STORE - Fatal error!' );
    end

  else

    value = [];
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P20_R8_STORE - Fatal error!\n' );
    fprintf ( 1, '  Unexpected ACTION = "%s".\n', action );
    error ( 'P20_R8_STORE - Fatal error!' );

  end

  return
end
