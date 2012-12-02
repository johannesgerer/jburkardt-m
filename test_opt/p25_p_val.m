function p = p25_p_val ( action, p )

%*****************************************************************************80
%
%% P25_P_VAL sets or gets the value of a parameter for problem 25.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string ACTION.
%    'S', set the interval value to the input value of P.
%    'G', set the output value of P to the internal value.
%
%    Input/output, real P, the value of the parameter that
%    multiplies the Gaussian noise.
%
  persistent p_save

  if ( action(1) == 'S' || action(1) == 's' )
    p_save = p;
  elseif ( action(1) == 'G' || action(1) == 'g' )
    p = p_save;
  end

  return
end
