function month_name = i4_to_month_name ( m )

%*****************************************************************************80
%
%% I4_TO_MONTH_NAME returns the name of a given month.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of the month, which should
%    be between 1 and 12.
%
%    Output, string MONTH_NAME, a string containing as much 
%    of the month's name as will fit.  
%
  name = [ ...
    'January  ', 'February ', 'March    ', 'April    ', ...
    'May      ', 'June     ', 'July     ', 'August   ', ...
    'September', 'October  ', 'November ', 'December ' ];

  if ( m < 1 || 12 < m )
    month_name = '???';
  else
    month_name = name(m);
  end

  return
end
