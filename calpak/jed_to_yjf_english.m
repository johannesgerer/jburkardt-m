function [ y, j, f ] = jed_to_yjf_english ( jed )

%*****************************************************************************80
%
%% JED_TO_YJF_ENGLISH converts a JED to an English YJF date.
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
  [ y1, m1, d1, f1 ] = jed_to_ymdf_english ( jed );

  [ y, j, f ] = ymdf_to_yjf_english ( y1, m1, d1, f1 );

  return
end
