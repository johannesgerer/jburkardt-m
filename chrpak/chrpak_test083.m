function chrpak_test083 ( )

%*****************************************************************************80
%
%% TEST083 tests R4_TO_S_LEFT and S_TO_R4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 November 2006
%
%  Author:
%
%    John Burkardt
%
  test_num = 3;

  stest(1,1:12) = ' 52.134ABCDE';
  stest(2,1:12) = ' 8.0/2.0    ';
  stest(3,1:12) = '12E1, 34, 56';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST083\n' );
  fprintf ( 1, '  S_TO_R4, string -> real number;\n' );
  fprintf ( 1, '  R4_TO_S_LEFT, real number -> string.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  S --> S_TO_R4 --> R4_TO_S_LEFT\n' );
  fprintf ( 1, '\n' );

  for i = 1 : test_num

    s = stest(i,1:12);

    r = s_to_r4 ( s );

    s2 = r4_to_s_left ( r );

    fprintf ( 1, '  %12s  %12f  %12s\n', s, r, s2 );

  end

  return
end
