function calpak_test49 ( )

%*****************************************************************************80
%
%% CALPAK_TEST49 tests S_TO_YMDHMS_COMMON.
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
  n_test = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST49\n' );
  fprintf ( 1, '  S_TO_YMDHMS_COMMON converts a string to a YMDHMS date.\n' );
  fprintf ( 1, '\n' );
 
  for i_test = 1 : n_test

    if ( i_test == 1 )
      s = '1999-10-31-14-59-47';
      p = 'YYYY-MM-DD-hh-mm-ss';
    elseif ( i_test == 2 )
      s = '8:30, 01 April 2004';
      p = 'h:mm, DD NNNNN YYYY';
    end

    [ y, m, d, h, n, second ] = s_to_ymdhms_common ( s, p );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %s\n', s );
    fprintf ( 1, '  %s\n', p );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  %d/%02d/%02d  %02d:%02d:%02d\n', y, m, d, h, n, second );

  end

  return
end