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
%    28 August 1999
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
  if ( w == 1 )
    s = 'Sunday';
  elseif ( w == 2 )
    s = 'Monday';
  elseif ( w == 3 )
    s = 'Tuesday';
  elseif ( w == 4 )
    s = 'Wednesday';
  elseif ( w == 5 )
    s = 'Thursday';
  elseif ( w == 6 )
    s = 'Friday';
  elseif ( w == 7 )
    s = 'Saturday';
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'WEEKDAY_TO_NAME_COMMON - Fatal error!\n' );
    fprintf ( 1, '  Index W must be between 1 and 7.\n' );
    error ( 'WEEKDAY_TO_NAME_COMMON - Fatal error!' );
  end

  return
end
