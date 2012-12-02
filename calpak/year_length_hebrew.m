function value = year_length_hebrew ( y )

%*****************************************************************************80
%
%% YEAR_LENGTH_HEBREW returns the number of days in a Hebrew year.
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
  jed = new_year_to_jed_hebrew ( y );

  y2 = y + 1;
  jed2 = new_year_to_jed_hebrew ( y2 );

  value = round ( jed2 - jed );

  return
end
