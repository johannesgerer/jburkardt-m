function month_name = month_to_month_name_republican2 ( m )

%*****************************************************************************80
%
%% MONTH_TO_MONTH_NAME_REPUBLICAN2 returns the mock name of a Republican month.
%
%  Discussion:
%
%    The mock names were devised by George Ellis, were only provided for the
%    12 main months, and begin with a translation of Nivose, which is roughly
%    January.
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
    'Snowy  '; 'Flowy  '; 'Blowy  '; ...
    'Showery'; 'Flowery'; 'Bowery '; ...
    'Hoppy  '; 'Croppy '; 'Droppy '; ...
    'Breezy '; 'Sneezy '; 'Freezy ' ];

  if ( m < 1 || 12 < m )

    month_name = '???????';

  else

    month_name = name(m,:);

  end

  return
end
