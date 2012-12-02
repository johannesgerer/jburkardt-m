function value = year_length_months_hebrew ( y )

%*****************************************************************************80
%
%% YEAR_LENGTH_MONTHS_HEBREW returns the number of months in a Hebrew year.
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
%    Output, integer VALUE, the number of months in the year.
%
  if ( year_is_embolismic_hebrew ( y ) )
    value = 13;
  else
    value = 12;
  end

  return
end
