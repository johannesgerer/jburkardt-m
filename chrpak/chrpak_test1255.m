function chrpak_test1255 ( )

%*****************************************************************************80
%
%% TEST1255 tests S_SORT_A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2007
%
%  Author:
%
%    John Burkardt
%
  test_num = 5;

  s_test(1,1:20) = 'HELLO World   !! !  ';
  s_test(2,1:20) = '12345678901234567890';
  s_test(3,1:20) = 'Abc Def Ghi Jkl Mno ';
  s_test(4,1:20) = 'AbleBakerCharlieDelt';
  s_test(5,1:20) = 'What? You have seen?';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1255\n' );
  fprintf ( 1, '  S_SORT_A ascending sorts a string.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  -------String-------  -------Sorted-------\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    s = s_test(test,1:20);
    s = s_sort_a ( s );
    fprintf ( 1, '  "%s"  "%s"\n', s_test(test,1:20), s );
  end

  return
end
