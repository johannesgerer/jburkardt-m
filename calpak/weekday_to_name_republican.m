function s = weekday_to_name_republican ( w )

%*****************************************************************************80
%
%% WEEKDAY_TO_NAME_REPUBLICAN returns the name of a Republican weekday.
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
    'Primedi ', ...
    'Duodi   ', ...
    'Tridi   ', ...
    'Quartidi', ...
    'Quintidi', ...
    'Sextidi ', ...
    'Septidi ', ...
    'Octidi  ', ...
    'Nonidi  ', ...
    'Decadi  ' ];

  if ( w < 1 || 10 < w )
    s = '?????';
  else
    s = weekday_name(w,:);
  end


  return
end
