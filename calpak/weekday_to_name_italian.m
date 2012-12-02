function s = weekday_to_name_italian ( w )

%*****************************************************************************80
%
%% WEEKDAY_TO_NAME_ITALIAN returns the name of an Italian weekday.
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
    'domenica ', 
    'lunedi   ', 
    'martedi  ', 
    'mercoledi', 
    'giovedi  ', 
    'venerdi  ', 
    'sabato   '];
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
