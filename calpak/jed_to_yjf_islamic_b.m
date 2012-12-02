function [ y, j, f ] = jed_to_yjf_islamic_b ( jed )

%*****************************************************************************80
%
%% JED_TO_YJF_ISLAMIC_B converts a JED to an Islamic-B YJF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2012
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
  [ y1, m1, d1, f1 ] = jed_to_ymdf_islamic_b ( jed );

  [ y, j, f ] = ymdf_to_yjf_islamic ( y1, m1, d1, f1 );

  return
end
