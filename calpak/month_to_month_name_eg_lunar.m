function month_name = month_to_month_name_eg_lunar ( m )

%*****************************************************************************80
%
%% MONTH_TO_MONTH_NAME_EG_LUNAR returns the name of an Egyptian Lunar month.
%
%  Discussion:
%
%    "Akhet" means "flood",
%    "Peret" means "going forth" (for planting),
%    "Shomu" means "deficiency" (the dry season).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the month.
%
%    Output, string MONTH_NAME, the month name.
%
  name = [ ...
    'Akhet I   '; 'Akhet II  '; 'Akhet III '; 'Akhet IV  '; ...
    'Peret I   '; 'Peret II  '; 'Peret III '; 'Peret IV  '; ...
    'Shomu I   '; 'Shomu II  '; 'Shomu III '; 'Shomu IV  '; ...
    'Shomu V   ' ];

  if ( m < 1 || 13 < m )
    month_name = '?????';
  else
    month_name = name(m,:);
  end

  return
end