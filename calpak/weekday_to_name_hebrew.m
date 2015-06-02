function s = weekday_to_name_hebrew ( w )

%*****************************************************************************80
%
%% WEEKDAY_TO_NAME_HEBREW returns the name of a Hebrew weekday.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 April 2013
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
    'Yom rishon  '; ...
    'Yom sheni   '; ...
    'Yom shelishi'; ...
    'Yom revii   '; ...
    'Yom hamishi '; ...
    'Yom shishi  '; ...
    'Sabbath     ' ];
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
