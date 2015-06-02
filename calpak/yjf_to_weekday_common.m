function w = yjf_to_weekday_common ( y, j, f )

%*****************************************************************************80
%
%% YJF_TO_WEEKDAY_COMMON returns the weekday of a Common YJF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, J, real F, the YJF date.
%
%    Output, integer W, is the week day number of the date, with
%    1 for Sunday, through 7 for Saturday.
%
  jed = yjf_to_jed_common ( y, j, f );

  [ w, f2 ] = jed_to_weekday ( jed );

  return
end
