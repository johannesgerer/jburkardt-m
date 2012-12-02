function chrpak_test129 ( )

%*****************************************************************************80
%
%% TEST129 tests S_TO_FORMAT
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2006
%
%  Author:
%
%    John Burkardt
%
  test_num = 7;

  stest(1,1:20) = 'a80                 ';
  stest(2,1:20) = 'f8.4                ';
  stest(3,1:20) = '3g14.6              ';
  stest(4,1:20) = 'i12                 ';
  stest(5,1:20) = '12l1                ';
  stest(6,1:20) = '(10o11)             ';
  stest(7,1:20) = ' ( 5 z 11.7  )      ';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST129\n' );
  fprintf ( 1, '  S_TO_FORMAT, string -> FORTRAN format RcW.M;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '--------String------     R  c     W      M\n' );
  fprintf ( 1, '\n' );

  for i = 1 : test_num

    [ r, c, w, m ] = s_to_format ( stest(i,1:20) );

    fprintf ( 1, '  %s  %6d  %c  %6d  %6d\n', stest(i,1:20), r, c, w, m );

  end

  return
end
