function value = p20_r8 ( action, name, value )

%*****************************************************************************80
%
%% P20_R8 sets or gets R8 parameters for problem 20.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string ACTION,
%    'D' sets the parameter to its default value;
%    'G' gets a parameter.
%    'R' sets the parameter to a random value.
%    'S' sets a parameter,
%
%    Input, string NAME, the name of the parameter.
%    'A' is the value of all lower integral bounds.
%    'B' is the value of all upper integral bounds.
%    'P' is the value of the exponent in the integrand.
%
%    Input/output, real VALUE.
%    * If ACTION = 'S', then VALUE is an input quantity, and is the
%      new value to be assigned to NAME.
%    * If ACTION = 'G' or 'R', then VALUE is an output quantity, 
%      and is the current value of NAME.
%
  persistent a;
  persistent b;
  persistent p;

  if ( action == 'D' | action == 'd' )

    if ( name == 'A' | name == 'a' | name == '*' )
      a = 0.0;
    end

    if ( name == 'B' | name == 'b' | name == '*' )
      b = 1.0;
    end

    if ( name == 'P' | name == 'p' | name == '*' )
      p = 2.0;
    end

  elseif ( action == 'G' | action == 'g' )

    if ( name == 'A' | name == 'a' )
      value = a;
    elseif ( name == 'B' | name == 'b' )
      value = b;
    elseif ( name == 'P' | name == 'p' )
      value = p;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P20_R8 - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized name = "%s".\n', name );
      error ( 'P20_R8 - Fatal error!' );
    end

  elseif ( action == 'R' | action == 'r' )

    if ( name == 'A' | name == 'a' )
      a = rand ( 1, 1 );
      value = a;
    elseif ( name == 'B' | name == 'b' )
      b = rand ( 1, 1 );
      value = b;
    elseif ( name == 'P' | name == 'p' )
      p = rand ( 1, 1 );
      value = p;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P20_R8 - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized name = "%s".\n', name );
      error ( 'P20_R8 - Fatal error!' );
    end

  elseif ( action == 'S' | action == 's' )

    if ( name == 'A' | name == 'a' )
      a = value;
    elseif ( name == 'B' | name == 'b' )
      b = value;
    elseif ( name == 'P' | name == 'p' )
      p = value;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P20_R8 - Fatal error!\n' );
      fprintf ( 1, '  Unrecognized name = "%s".\n', name );
      error ( 'P20_R8 - Fatal error!' );
    end

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P20_R8 - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized action = "%s".\n', action );
    error ( 'P20_R8 - Fatal error!' );

  end

  return
end
