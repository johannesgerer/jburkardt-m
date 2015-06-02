function [ y2, m2, d2, h2, n2, s2 ] = yjf_to_ymdhms_common ( y1, j1, f1 )

%*****************************************************************************80
%
%% YJF_TO_YMDHMS_COMMON converts a Common YJF date to a YMDHMS date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y1, J1, real F1, the YJF date.
%
%    Output, integer Y2, M2, D2, H2, N2, S2, the YMDHMS date.
%
  [ y1, j1, f1, ierror ] = yjf_check_common ( y1, j1, f1 );

  if ( ierror ~= 0 )
    y2 = 0;
    m2 = 0;
    d2 = 0;
    h2 = 0;
    n2 = 0;
    s2 = 0;
  end

  [ y2, m2, d2, f2 ] = yjf_to_ymdf_common ( y1, j1, f1 );

  [ h2, n2, s2 ] = frac_to_hms ( f2 );

  return
end