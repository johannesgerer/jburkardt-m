function s = ymd_to_s_numeric ( y, m, d )

%*****************************************************************************80
%
%% YMD_TO_S_NUMERIC writes a YMD date into a string.
%
%  Format:
%
%       YYYY/MM/DD
%    or
%      -YYYY/MM/DD
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 December 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, integer M, integer D, the YMD date.
%
%    Output, string S, a representation of the date.
%

%
%  Make local copies of the input.
%
  y2 = y;
  m2 = m;
  d2 = d;

  s1 = i4_to_s_left ( y2 );

  s1 = s_cat ( s1, '/' );

  s2 = i4_to_s_zero ( m2, 2 );

  s1 = s_cat ( s1, s2 );

  s1 = s_cat ( s1, '/' );

  s2 = i4_to_s_zero ( d2, 2 );

  s = s_cat ( s1, s2 );

  return
end
