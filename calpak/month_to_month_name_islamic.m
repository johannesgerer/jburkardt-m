function month_name = month_to_month_name_islamic ( m )

%*****************************************************************************80
%
%% MONTH_TO_MONTH_NAME_ISLAMIC returns the name of an Islamic month.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2013
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
    'Muharram  '; 'Safar     '; 'Rabi I    '; 'Rabi II   '; ...
    'Jumada I  '; 'Jumada II '; 'Rajab     '; 'Shaban    '; ...
    'Ramadan   '; 'Shawwal   '; 'Dhul-quda '; 'Dhul-hejji' ];

  if ( m < 1 || 12 < m )

    month_name = '??????????';

  else

    month_name = name(m,:);

  end

  return
end
