function value = year_is_embolismic_greek ( y )

%*****************************************************************************80
%
%% YEAR_IS_EMBOLISMIC_GREEK returns TRUE if the Greek year was embolismic.
%
%  Discussion:
%
%    Apparently, the Greek calendar was emended haphazardly.  This
%    routine does not attempt to follow that historical pattern, and
%    just uses the Hebrew calendar pattern for now.
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
