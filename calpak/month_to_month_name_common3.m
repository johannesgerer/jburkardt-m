function month_name = month_to_month_name_common3 ( m )

%*****************************************************************************80
%
%% MONTH_TO_MONTH_NAME_COMMON3 returns an abbreviation of a Common month.
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
%    Input, integer M, the month index.
%
%    Output, string MONTH_NAME, the month name.
%
  name = [ ...
    'Jan'; 'Feb'; 'Mar'; 'Apr'; ...
    'May'; 'Jun'; 'Jul'; 'Aug'; ...
    'Sep'; 'Oct'; 'Nov'; 'Dec' ];

  if ( m < 1 || 12 < m )

    month_name = '???';

  else

    month_name = name(m,:);

  end

  return
end
