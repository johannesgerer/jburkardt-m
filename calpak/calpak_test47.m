function calpak_test47 ( )

%*****************************************************************************80
%
%% CALPAK_TEST47 tests S_TO_HMS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST47\n' );
  fprintf ( 1, '  S_TO_HMS converts a string to an HMS date.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ------S--------  ------P--------  HH:MM:SS\n' );
  fprintf ( 1, '\n' );

  s1 = '10:30:44';
  p = 'hh:mm:ss';

  [ h2, m2, s2 ] = s_to_hms ( s1, p );

  s3 = hms_to_s ( h2, m2, s2 );

  fprintf ( 1, '  %10s  %10s  %10s\n', s1, p, s3 );

  s1 = '10 past 9';
  p = 'mm xxxx h';

  [ h2, m2, s2 ] = s_to_hms ( s1, p );

  s3 = hms_to_s ( h2, m2, s2 );

  fprintf ( 1, '  %10s  %10s  %10s\n', s1, p, s3 );

  return
end