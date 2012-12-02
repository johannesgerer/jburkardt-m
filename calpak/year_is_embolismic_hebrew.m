function value = year_is_embolismic_hebrew ( y )

%*****************************************************************************80
%
%% YEAR_IS_EMBOLISMIC_HEBREW returns TRUE if the Hebrew year was embolismic.
%
%  Discussion:
%
%    In a 19 year cycle, there are 7 embolismic years.  During these years,
%    an extra month, "Adar II", (sometimes called "Veadar") is inserted after
%    the month of Adar.  Nonembolismic years are called "common" years.
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
%    Output, logical VALUE, TRUE if the year was embolismic.
%
  if ( 12 <= i4_modp ( 7 * y + 13, 19 ) )
    value = 1;
  else
    value = 0;
  end

  return
end
