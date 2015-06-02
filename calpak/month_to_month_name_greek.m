function month_name = month_to_month_name_greek ( y, m )

%*****************************************************************************80
%
%% MONTH_TO_MONTH_NAME_GREEK returns the name of a Greek month.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 March 2013
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
    'Hecatombaeon'; 'Metageitnion'; 'Boedromion  '; 'Pyanepsion  '; ...
    'Maemacterion'; 'Poseidon    '; 'Poseidon II '; 'Gamelion    '; ...
    'Anthesterion'; 'Elaphebolion'; 'Munychion   '; 'Thargelion  '; ...
    'Scirophorion' ];
%
%  13 month year.
%
  if ( year_is_embolismic_greek ( y ) )

    if ( m < 1 || 13 < m )

      month_name = '?????';

    else

      month_name = name(m,:);

    end
%
%  12 month year.
%
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
