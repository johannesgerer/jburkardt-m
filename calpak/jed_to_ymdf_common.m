function [ y, m, d, f ] = jed_to_ymdf_common ( jed )

%*****************************************************************************80
%
%% JED_TO_YMDF_COMMON converts a JED to a Common YMDF date.
%
%  Discussion:
%
%    The "common" calendar is meant to be the calendar which is Julian up to
%    JED = 2299160.5, and Gregorian thereafter.
%
%    There is no year 0.  BC years are specified using a negative value.
%
%  Example:
%
%        JED            Y    M   D
%    -------    ------------------
%          0    BCE  4713  Jan   1
%    2440000    CE   1968  May  23
%    2446065    CE   1984  Dec  31
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real JED, the Julian Ephemeris Date.
%
%    Output, integer Y, M, D, real F, the YMDF date.
%
  jed_transition = transition_to_jed_common ( );

  if ( jed <= jed_transition )
    [ y, m, d, f ] = jed_to_ymdf_julian ( jed );
  else
    [ y, m, d, f ] = jed_to_ymdf_gregorian ( jed );
  end

  return
end