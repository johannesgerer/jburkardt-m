function month_name = month_to_month_name_hindu_lunar ( m )

%*****************************************************************************80
%
%% MONTH_TO_MONTH_NAME_HINDU_LUNAR returns the name of a Hindu lunar month.
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
    'Chaitra   '; 'Vaisakha  '; 'Jyaishtha '; 'Ashadha   '; ...
    'Sravana   '; 'Bhadrapada'; 'Asvina    '; 'Karttika  '; ...
    'Margasira '; 'Pausha    '; 'Magha     '; 'Phalguna  ' ];

  if ( m < 1 || 12 < m )

    month_name = '??????????';

  else

    month_name = name(m,:);

  end

  return
end
