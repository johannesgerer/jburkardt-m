function month_name = month_to_month_name_republican ( m )

%*****************************************************************************80
%
%% MONTH_TO_MONTH_NAME_REPUBLICAN returns the name of a Republican month.
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
    'Vendemaire    '; 'Brumaire      '; 'Frimaire      '; 'Nivose        '; ...
    'Pluviose      '; 'Ventose       '; 'Germinal      '; 'Floreal       '; ...
    'Prairial      '; 'Messidor      '; 'Thermidor     '; 'Fructidor     '; ...
    'Sansculottides' ];

  if ( m < 1 || 13 < m )

    month_name = '??????????????';

  else

    month_name = name(m,:);

  end

  return
end
