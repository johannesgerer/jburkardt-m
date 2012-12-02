function x = p20_start ( option, nvar )

%*****************************************************************************80
%
%% P20_START returns a starting point for problem 20.
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
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Output, real X(NVAR), the starting point.
%
  hold_index = p20_i4_get ( 'hold_index' );
  hold_value = p20_r8_get ( 'hold_value' );

  if ( hold_index == 1 )
    l = hold_value;
    theta = pi / 8.0;
  elseif ( hold_index == 2 )
    l = 0.25;
    theta = hold_value;
  else
    l = 0.25;
    theta = pi / 8.0;
  end

  [ lambda, mu ] = p20_setup ( l, theta );

  x = [ l, theta, lambda, mu ]';

  return
end
