function s = weekday_to_name_french ( w )

%*****************************************************************************80
%
%% WEEKDAY_TO_NAME_FRENCH returns the name of a French weekday.
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
    'Dimanche'; ...
    'Lundi   '; ...
    'Mardi   '; ...
    'Mercredi'; ...
    'Jeudi   '; ...
    'Vendredi'; ...
    'Samedi  ' ];
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
