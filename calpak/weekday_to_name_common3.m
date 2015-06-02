function s = weekday_to_name_common3 ( w )

%*****************************************************************************80
%
%% WEEKDAY_TO_NAME_COMMON3 returns the abbreviated name of a Common weekday.
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
%    Input, integer W, the weekday index.
%
%    Output, string S, the abbreviated weekday name.
%
  weekday_name = [ ...
    'Sun'; ...
    'Mon'; ...
    'Tue'; ...
    'Wed'; ...
    'Thu'; ...
    'Fri'; ...
    'Sat' ];
%
%  Check the weekday number.
%
  w2 = weekday_check_common ( w );
%
%  Return the weekday name.
%
  s = weekday_name(w2,:);

  return
end
