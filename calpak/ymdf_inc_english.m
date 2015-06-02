function [ y2, m2, d2, f2 ] = ymdf_inc_english ( y1, m1, d1, f1, days )

%*****************************************************************************80
%
%% YMDF_INC_ENGLISH increments an English YMDF date by DAYS days.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 April 2103
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
%    Input, real DAYS, the number of days to advance the date.
%
%    Output, integer Y2, M2, D2, real F2, the
%    incremented YMDF date.
%

%
%  Copy the parameters.
%
  y2 = y1;
  m2 = m1;
  d2 = d1;
  f2 = f1 + days;
%
%  Check the parameters.
%
  [ y2, m2, d2, f2, ierror ] = ymdf_check_english ( y2, m2, d2, f2 );

  return
end