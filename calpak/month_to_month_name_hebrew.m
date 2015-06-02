function month_name = month_to_month_name_hebrew ( y, m )

%*****************************************************************************80
%
%% MONTH_TO_MONTH_NAME_HEBREW returns the name of a Hebrew month.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, M, the year and month.
%
%    Output, string MONTH_NAME, the month name.
%
  name = [ ...
    'Tishri   '; 'Heshvan  '; 'Kislev   '; 'Tebet    '; 'Shebat   '; ...
    'Adar     '; 'Veadar   '; 'Nisan    '; 'Iyar     '; 'Sivan    '; ...
    'Tammuz   '; 'Ab       '; 'Elul     ' ];

  if ( year_is_embolismic_hebrew ( y ) )

    if ( m < 1 || 13 < m )
      month_name = '?????';
    else
      month_name = name(m,:);
    end

  else

    if ( m < 1 || 12 < m )
      month_name = '?????';
    elseif ( m <= 6 )
      month_name = name(m,:);
    else
      month_name = name(m+1,:);
    end

  end

  return
end
