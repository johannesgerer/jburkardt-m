function month_name = month_to_month_name_zoroastrian ( m )

%*****************************************************************************80
%
%% MONTH_TO_MONTH_NAME_ZOROASTRIAN returns the name of a Zoroastrian month.
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
    'Furvurdeen '; 'Ardibehest '; 'Khordad    '; 'Tir        '; ...
    'Amerdad    '; 'Sherever   '; 'Moher      '; 'Aban       '; ...
    'Adur       '; 'Deh        '; 'Bahman     '; 'Aspendadmad' ];

  if ( m < 1 || 12 < m )

    month_name = '?????';

  else

    month_name = name(m,:);

  end

  return
end
