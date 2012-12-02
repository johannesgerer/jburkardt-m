function [ y, m, d, f ] = jed_to_ymdf_roman ( jed )

%*****************************************************************************80
%
%% JED_TO_YMDF_ROMAN converts a JED to a Roman YMDF date.
%
%  Discussion:
%
%    The Roman calendar used here is artificial.  It is assumed to begin
%    on the Julian calendar date 1 January 753 BC, and to be simply a
%    copy of the Julian calendar, shifted by 753 years.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real JED, the Julian Ephemeris Date.
%
%    Output, integer Y, M, D, real F,
%    the YMDF date.
%
  [ y, m, d, f ] = jed_to_ymdf_julian ( jed );

  y = y_julian_to_roman ( y );

  return
end
