function [ y2, j2, f2 ] = ymdf_to_yjf_hebrew ( y1, m1, d1, f1 )

%*****************************************************************************80
%
%% YMDF_TO_YJF_HEBREW converts from YMDF to YJF form in the Hebrew calendar.
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
%  Parameters:
%
%    Input, integer Y1, M1, D1, real F1,
%    the YMDF date.
%
%    Output, integer Y2, J2, real F2, the YJF date.
%
  y2 = y1;
  j2 = d1;
  f2 = f1;

  for m = 1 : m1 - 1
    j2 = j2 + month_length_hebrew ( y1, m );
  end

  return
end
