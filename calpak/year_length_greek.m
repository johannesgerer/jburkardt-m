function value = year_length_greek ( y )

%*****************************************************************************80
%
%% YEAR_LENGTH_GREEK returns the number of days in a Greek year.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the year to be checked.
%
%    Output, integer VALUE, the number of
%    days in the year.
%
  if ( year_is_embolismic_greek ( y ) )
    value = 386;
    if ( year_is_leap_greek ( y ) )
      value = value + 1;
    end
  else
    value = 357;
  end

  return
end