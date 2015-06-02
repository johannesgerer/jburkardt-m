function month_name = month_to_month_name_bahai ( m )

%*****************************************************************************80
%
%% MONTH_TO_MONTH_NAME_BAHAI returns the name of a Bahai month.
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
%    Input, integer M, the month index.
%
%    Output, string MONTH_NAME, the month name.
%
  name = [ ...
    'Baha      '; 'Jalal     '; 'Jamal     '; 'Azamat    '; ...
    'Nur       '; 'Rahmat    '; 'Kalimat   '; 'Kamal     '; ...
    'Asma      '; 'Izzat     '; 'Mashiyyat '; 'Ilm       '; ...
    'Qudrat    '; 'Qawl      '; 'Masail    '; 'Sharaf    '; ...
    'Sultan    '; 'Mulk      '; 'Ayyam-i-Ha'; 'Ala       ' ];

  if ( m < 1 || 20 < m )
    month_name = '?????';
  else
    month_name = name(m,:);
  end

  return
end
