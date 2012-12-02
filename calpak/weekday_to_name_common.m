function s = weekday_to_name_common ( w )

%*****************************************************************************80
%
%% WEEKDAY_TO_NAME_COMMON returns the name of a Common weekday.
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
%    Input, integer W, the weekday index.
%
%    Output, string S, the weekday name.
%
  weekday_name = [ ...
    'Sunday   '; ...
    'Monday   '; ...
    'Tuesday  '; ...
    'Wednesday'; ...
    'Thursday '; ...
    'Friday   '; ...
    'Saturday ' ];
%
%  Make a local copy of the weekday number.
%
  w2 = w;
%
%  Check the weekday number.
%
  weekday_check_common ( w2 );
%
%  Return the weekday name.
%
  s = weekday_name(w2,:);

  return
end
