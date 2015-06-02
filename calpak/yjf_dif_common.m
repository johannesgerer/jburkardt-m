function [ days, ierror ] = yjf_dif_common ( y1, j1, f1, y2, j2, f2 )

%*****************************************************************************80
%
%% YJF_DIF_COMMON computes day difference between two Common YJF dates.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y1, J1, real F1,
%    the first YJF date.
%
%    Input, integer Y2, J2, real F2,
%    the second YJF date.
%
%    Output, real DAYS, the day difference between the two dates.
%
%    Output, integer IERROR, is 1 if either date is illegal,
%    0 otherwise.
%

%
%  Check the dates.
%
  [ y1, j1, f1, ierror ] = yjf_check_common ( y1, j1, f1 );

  if ( ierror ~= 0 )
    return
  end

  [ y2, j2, f2, ierror ] = yjf_check_common ( y2, j2, f2 );

  if ( ierror ~= 0 )
    return
  end

  jed1 = yjf_to_jed_common ( y1, j1, f1 );

  jed2 = yjf_to_jed_common ( y2, j2, f2 );

  days = jed2 - jed1;

  return
end