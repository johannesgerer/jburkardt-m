function [ y, m, d, f ] = jed_to_ymdf_hebrew ( jed )

%*****************************************************************************80
%
%% JED_TO_YMDF_HEBREW converts a JED to a Hebrew YMDF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Edward Richards,
%    Algorithm I,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999, page 334.
%
%  Parameters:
%
%    Input, real JED, the Julian Ephemeris Date.
%
%    Output, integer Y, M, D, real F, the YMDF date.
%
  y1 = jed_to_year_hebrew ( jed );

  jed2 = new_year_to_jed_hebrew ( y1 );

  type = year_to_type_hebrew ( y1 );

  j1 = floor ( jed - jed2 );
  f1 = ( jed - jed2 ) - j1;

  j1 = j1 + 1;

  [ y, m, d, f ] = yjf_to_ymdf_hebrew ( y1, j1, f1 );

  return
end
