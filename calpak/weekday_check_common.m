function w = weekday_check_common ( w )

%*****************************************************************************80
%
%% WEEKDAY_CHECK_COMMON makes sure the Common weekday number is between 1 and 7.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer W, the weekday index.
%
  w = i4_wrap ( w, 1, 7 );

  return
end
