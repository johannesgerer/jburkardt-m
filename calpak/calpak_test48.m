function calpak_test48 ( )

%*****************************************************************************80
%
%% CALPAK_TEST48 tests S_TO_YMD_COMMON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    07 April 2013
%
%  Author:
%
%    John Burkardt
%
  n_test = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST48\n' );
  fprintf ( 1, '  S_TO_YMD_COMMON converts a string to a YMD date.\n' );
  fprintf ( 1, '\n' );
 
  for i_test = 1 : n_test

    if ( i_test == 1 )
      s = '1999-10-31';
      p = 'yyyy-mm-dd';
    elseif ( i_test == 2 )
      s = '01/04/2004';
      p = 'dd/mm/yyyy';
    elseif ( i_test == 3 )
      s = '8/8/88';
      p = 'd/m/yy';
    elseif ( i_test == 4 )
      s = '4 7';
      p = 'd m';
    elseif ( i_test == 5 )
      s = 'On day 1 of month 3 of year 1945';
      p = 'xx xxx d xx xxxxx m xx xxxx yyyy';
    end

    [ y, m, d ] = s_to_ymd_common ( s, p );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %s\n', s );
    fprintf ( 1, '  %s\n', p );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  %4d  %2d  %2d\n', y, m, d );

  end

  return
end
