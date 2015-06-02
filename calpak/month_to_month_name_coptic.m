function month_name = month_to_month_name_coptic ( m )

%*****************************************************************************80
%
%% MONTH_TO_MONTH_NAME_COPTIC returns the name of a Coptic month.
%
%  Discussion:
%
%    The names are closely related to the month names of the Egyptian
%    Civil calendar.
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
    'Tut       '; 'Babah     ';  'Hatur     '; 'Kiyahk    '; ...
    'Tubah     '; 'Amshir    ';  'Baramhat  '; 'Baramundah'; ...
    'Bashans   '; 'Ba''unah   ';  'Abib      '; 'Misra     '; ...
    'al-Nasi   ' ];

  if ( m < 1 || 13 < m )
    month_name = '?????';
  else
    month_name = name(m,:);
  end

  return
end
