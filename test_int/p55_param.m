function value = p55_param ( action, name, value )

%*****************************************************************************80
%
%% P55_PARAM sets or gets real scalar parameters for problem 55.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string ACTION,
%    'GET' to get a parameter.
%    'RANDOMIZE' to randomize a parameter,
%    'SET' to set a parameter.
%
%    Input, string NAME, the name of the variable.
%    'C' is the coefficient.
%    'X0' is the base point.
%
%    Input/output, real VALUE.
%    * If ACTION = 'SET', then VALUE is an input quantity, and is the
%      new value to be assigned to NAME.
%    * If ACTION = 'GET', then VALUE is an output quantity, and is the
%      current value of NAME.
%
  persistent c;
  persistent x0;

  if ( s_eqi ( action, 'get' ) )

    if ( s_eqi ( name, 'c' ) )
      if ( isempty ( c ) )
        c = 3.0;
      end
      value = c;
    elseif ( s_eqi ( name, 'x0' ) )
      if ( isempty ( x0 ) )
        x0 = 0.75;
      end
      value = x0;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P55_PARAM - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized name.\n' );
      error ( 'P55_PARAM - Fatal error!' );
    end

  elseif ( s_eqi ( action, 'random' ) )

    if ( s_eqi ( name, 'c' ) )
      c = rand ( );
    elseif ( s_eqi ( name, 'x0' ) )
      x0 = rand ( );
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P55_PARAM - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized name.\n' );
      error ( 'P554_PARAM - Fatal error!' );
    end

  elseif ( s_eqi ( action, 'set' ) )

    if ( s_eqi ( name, 'c' ) )
      c = value;
    elseif ( s_eqi ( name, 'x0' ) )
      x0 = value;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P55_PARAM - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized name.\n' );
      error ( 'P55_PARAM - Fatal error!' );
    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P55_PARAM - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized action.\n' );
    error ( 'P55_PARAM - Fatal error!' );

  end

  return
end
