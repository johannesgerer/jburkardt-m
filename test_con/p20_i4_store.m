function value = p20_i4_store ( action, name, value )

%*****************************************************************************80
%
%% P20_I4_STORE sets or gets the value of an integer parameter for problem 20.
%
%  Discussion:
%
%    The only legal input name is 'hold_index', which indicates the
%    index of the variable to be held fixed.  This variable is given
%    the default value of 2.
%
%    The only legal values of 'hold_index' are 1 and 2.
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
%    Input, integer VALUE, the value of the variable to be set, 
%    if ACTION is 'set'.
%
%    Output, integer VALUE, the value of the variable to get,
%    if ACTION is 'get'
%
  persistent hold_index;

  if ( s_eqi ( action, 'get' ) )

    if ( isempty ( hold_index ) )
      hold_index = 2;
    end

    if ( s_eqi ( name, 'hold_index' ) )
      value = hold_index;
    else
      value = [];
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P20_I4_STORE - Fatal error!\n' );
      fprintf ( 1, '  Unexpected "get" of NAME = "%s".\n', name );
      error ( 'P20_I4_STORE - Fatal error!' );
    end

  elseif ( s_eqi ( action, 'set' ) )

    if ( s_eqi ( name, 'hold_index' ) )
      if ( value == 1 | value == 2 )
        hold_index = value;
      else
        fprintf ( 1, '\n' );
        fprintf ( 1, 'P20_I4_STORE - Fatal error!\n' );
        fprintf ( 1, '  Unacceptable value for HOLD_INDEX = %d\n', value );
        fprintf ( 1, '  Acceptable values are 1 and 2.\n' );
        error ( 'P20_I4_STORE - Fatal error!' );
      end
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P20_I4_STORE - Fatal error!\n' );
      fprintf ( 1, '  Unexpected "set" of NAME = "%s".\n', name );
      error ( 'P20_I4_STORE - Fatal error!' );
    end

  else

    value = [];
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P20_I4_STORE - Fatal error!\n' );
    fprintf ( 1, '  Unexpected ACTION = "%s".\n', action );
    error ( 'P20_I4_STORE - Fatal error!' );

  end

  return
end
