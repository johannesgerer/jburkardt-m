function value = ch_roman_to_i4 ( c )

%*****************************************************************************80
%
%% CH_ROMAN_TO_I4 returns the integer value of a single digit of a Roman numeral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, a Roman numeral.
%
%    Output, integer VALUE, the value of the Roman numeral.
%    If the Roman numeral was not recognized, 0 is returned.
%
  if ( s_eqi ( c, 'M' ) )
    value = 1000;
  elseif ( s_eqi ( c, 'D' ) )
    value = 500;
  elseif ( s_eqi ( c, 'C' ) )
    value = 100;
  elseif ( s_eqi ( c, 'L' ) )
    value = 50;
  elseif ( s_eqi ( c, 'X' ) )
    value = 10;
  elseif ( s_eqi ( c, 'V' ) )
    value = 5;
  elseif ( s_eqi ( c, 'I' ) || s_eqi ( c, 'J' ) )
    value = 1;
  else
    value = 0;
  end

  return
end
