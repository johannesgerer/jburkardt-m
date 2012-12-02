function s = weekday_to_name_common2 ( w )

%*****************************************************************************80
%
%% WEEKDAY_TO_NAME_COMMON2 returns the abbreviated name of a Common weekday.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 September 2012
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
    'Su'; ...
    'M '; ...
    'Tu'; ...
    'W '; ...
    'Th'; ...
    'F '; ...
    'Sa' ];
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
