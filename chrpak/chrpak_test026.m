function chrpak_test026 ( )

%*****************************************************************************80
%
%% TEST026 tests CH_TO_ROT13.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 June 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST026\n' );
  fprintf ( 1, '  CH_TO_ROT13 "encodes" characters using ROT13\n' );
  fprintf ( 1, '  (and digits using ROT5).\n' );
  fprintf ( 1, '  A second application of the function returns the\n' );
  fprintf ( 1, '  original character.\n' );

  s1 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  for i = 1 : length ( s1 )
    s2(i) = ch_to_rot13 ( s1(i) );
    s3(i) = ch_to_rot13 ( s2(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '            CH  : %s\n', s1 );
  fprintf ( 1, '      ROT13(CH) : %s\n', s2 );
  fprintf ( 1, 'ROT13(ROT13(CH)): %s\n', s3 );

  s1 = 'CH_TO_ROT13 "encodes" characters using ROT13';
  for i = 1 : length ( s1 )
    s2(i) = ch_to_rot13 ( s1(i) );
    s3(i) = ch_to_rot13 ( s2(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '            CH  : %s\n', s1 );
  fprintf ( 1, '      ROT13(CH) : %s\n', s2 );
  fprintf ( 1, 'ROT13(ROT13(CH)): %s\n', s3 );

  return
end
