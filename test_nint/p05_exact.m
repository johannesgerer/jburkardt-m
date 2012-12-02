function value = p05_exact ( dim_num )

%*****************************************************************************80
%
%% P05_EXACT returns the exact integral for problem 05.
%
%  Discussion:
%
%    The exact value is given only for DIM_NUM = 1, 2, 3, 4 or 5.
%    For other cases, the value R8_HUGE is returned instead.
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
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Output, real VALUE, the exact value of the integral,
%    or R8_HUGE if the exact value is not known.
%
  if ( dim_num == 1 )

    value = log ( 3.0 );

  elseif ( dim_num == 2 )

    value = 5.0 * log ( 5.0 ) - 6.0 * log ( 3.0 );

  elseif ( dim_num == 3 )

    value = 0.5 * ( 49.0 * log ( 7.0 ) ...
      - 75.0 * log ( 5.0 ) + 27.0 * log ( 3.0 ) );

  elseif ( dim_num == 4 )

    value = 225.0 * log ( 3.0 ) + 125.0 * log ( 5.0 ) ...
      - 686.0 * log ( 7.0 ) / 3.0;

  elseif ( dim_num == 5 )

    value = ( ...
      - 65205.0 * log ( 3.0 ) ...
      - 6250.0 * log ( 5.0 ) ...
      + 24010.0 * log ( 7.0 ) ...
      + 14641.0 * log ( 11.0 ) ) / 24.0;

  else

    value = r8_huge ( );

  end

  return
end
