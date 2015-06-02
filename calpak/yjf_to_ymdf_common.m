function [ y2, m2, d2, f2 ] = yjf_to_ymdf_common ( y1, j1, f1 )

%*****************************************************************************80
%
%% YJF_TO_YMDF_COMMON converts a Common date from YJF to YMDF format.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y1, J1, real F1, the YJF date.
%
%    Output, integer Y2, M2, D2, real F2,
%    the YMDF date.
%

%
%  Copy the input.
%
  y2 = y1;
  j2 = j1;
  f2 = f1;
%
%  Check the input.
%
  [ y2, j2, f2, ierror ] = yjf_check_common ( y2, j2, f2 );

  if ( ierror ~= 0 )
    y2 = 0;
    m2 = 0;
    d2 = 0;
    f2 = 0.0;
    return
  end
%
%  Convert the input.
%
  d2 = j2;
  m2 = 1;

  [ y2, m2, d2 ] = day_borrow_common ( y2, m2, d2 );

  [ y2, m2, d2 ] = day_carry_common ( y2, m2, d2 );

  return
end