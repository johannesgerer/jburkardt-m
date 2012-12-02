function value = i4_power ( i, j )

%*****************************************************************************80
%
%% I4_POWER returns the value of I to the power J.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 September 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, the base and the power.  J should be nonnegative.
%
%    Output, integer VALUE, the value of I^J.
%
  if ( j < 0 )

    if ( i == 1 )
      value = 1;
    elseif ( i == 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'I4_POWER - Fatal error!\n' );
      fprintf ( 1, '  I^J requested, with I = 0 and J negative.\n' );
      error ( 'I4_POWER - Fatal error!' );
    else
      value = 0;
    end

  elseif ( j == 0 )

    if ( i == 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'I4_POWER - Fatal error!\n' );
      fprintf ( 1, '  I^J requested, with I = 0 and J = 0.\n' );
      error ( 'I4_POWER - Fatal error!' );
    else
      value = 1;
    end

  elseif ( j == 1 )

    value = i;

  else

    value = 1;
    for k = 1 : j
      value = value * i;
    end

  end

  return
end
