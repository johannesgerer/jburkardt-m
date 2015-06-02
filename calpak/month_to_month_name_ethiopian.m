function month_name = month_to_month_name_ethiopian ( m )

%*****************************************************************************80
%
%% MONTH_TO_MONTH_NAME_ETHIOPIAN returns the name of an Ethiopian month.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 March 2013
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
    'Maskaram  '; 'Teqemt    '; 'Khedar    '; 'Takhsas   '; ...
    'Ter       '; 'Yakatit   '; 'Magabit   '; 'Miyazya   '; ...
    'Genbot    '; 'Sane      '; 'Hamle     '; 'Nahase    '; ...
    'Paguemen  ' ];

  if ( m < 1 || 13 < m )
    month_name = '?????';
  else
    month_name = name(m,:);
  end

  return
end
