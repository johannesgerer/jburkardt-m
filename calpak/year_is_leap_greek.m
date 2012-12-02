function value = year_is_leap_greek ( y )

%*****************************************************************************80
%
%% YEAR_IS_LEAP_GREEK returns TRUE if the Greek year was a leap year.
%
%  Discussion:
%
%    The actual practice of adding the extra day to the Greek calendar
%    seems to have been unmethodical.  Here, we simply make up a rule
%    as a placeholder for now.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the year to be checked.
%
%    Output, logical VALUE, TRUE if the year was a leap year.
%
  if ( year_is_embolismic_greek ( y ) && ( mod ( y, 3 ) == 0 ) )
    value = 1;
  else
    value = 0;
  end

  return
end
