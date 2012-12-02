function [ y, j, f ] = jed_to_yjf_common ( jed )

%*****************************************************************************80
%
%% JED_TO_YJF_COMMON converts a JED to a Common YJF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real JED, the Julian Ephemeris Date.
%
%    Output, integer Y, J, real F, the YJF date.
%
  [ y1, m1, d1, f1 ] = jed_to_ymdf_common ( jed );

  [ y, j, f ] = ymdf_to_yjf_common ( y1, m1, d1, f1 );

  return
end
