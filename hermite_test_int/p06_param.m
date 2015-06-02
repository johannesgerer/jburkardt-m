function value = p06_param ( action, name, value )

%*****************************************************************************80
%
%% P06_PARAM gets or sets parameters for problem 6.
%
%  Discussion:
%
%    The parameter is named "M", and it represents the value of the exponent
%    in the integrand function:
%
%    Integral ( -oo < x < +oo ) x^m exp (-x*x) dx
%
%    M must be greater than -1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 May 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character ACTION, the action.
%    'S' to set the value,
%    'G' to get the value.
%
%    Input, character NAME, the parameter name.
%    'M', the exponent.
%
%    Input/output, integer VALUE, the parameter value.
%    If ACTION = 'S', then VALUE is an input quantity, and M is set to VALUE.
%    If ACTION = 'G', then VALUE is an output quantity, and VALUE is set to M.
%
  persistent m;

  if ( action == 'S' || action == 's' )

    if ( value <= -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P06_PARAM - Fatal error!\n' );
      fprintf ( 1, '  Parameter M must be greater than -1.\n' );
      error ( 'P06_PARAM - Fatal error!' );
    end

    m = value;

  elseif ( action == 'G' || action == 'g' )

    value = m;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P06_PARAM - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized value of ACTION = "%s".\n', action );
    error ( 'P06_PARAM - Fatal error!' );

  end

  return
end
