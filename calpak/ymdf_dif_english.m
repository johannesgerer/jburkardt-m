function [ days, ierror ] = ymdf_dif_english ( y1, m1, d1, f1, y2, m2, d2, ...
  f2, d )

%*****************************************************************************80
%
%% YMDF_DIF_ENGLISH gets the day difference between two English YMDF dates.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 April 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y1, M1, D1, the first YMDF date.
%
%    Input, integer Y2, M2, D2, the second YMDF date.
%
%    Output, real DAYS, the number of days between the two dates.
%
%    Output, integer IERROR, is 1 if either date is illegal,
%    0 otherwise.
%
  days = 0.0;
%
%  Check the dates.
%
  [ y1, m1, d1, f1, ierror ] = ymdf_check_english ( y1, m1, d1, f1 );

  if ( ierror ~= 0 )
    return
  end

  [ y2, m2, d2, f2, ierror ] = ymdf_check_english ( y2, m2, d2, f2 );

  if ( ierror ~= 0 )
    return
  end

  jed1 = ymdf_to_jed_english ( y1, m1, d1, f1 );

  jed2 = ymdf_to_jed_english ( y2, m2, d2, f2 );

  days = jed2 - jed1;

  return
end
