function filum_test13 ( )

%*****************************************************************************80
%
%% FILUM_TEST13 tests FILE_NAME_EXT_SWAP.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 June 2007
%
%  Author:
%
%    John Burkardt
%
  test_num = 5;

  file_name_test(1,1:11) = 'bob.for    ';
  file_name_test(2,1:11) = 'bob.bob.bob';
  file_name_test(3,1:11) = 'bob.       ';
  file_name_test(4,1:11) = 'bob        ';
  file_name_test(5,1:11) = '.oops      ';

  ext_test(1,1:3) = 'obj';
  ext_test(2,1:3) = 'txt';
  ext_test(3,1:3) = 'yak';
  ext_test(4,1:3) = 'ps ';
  ext_test(5,1:3) = 'eek';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST13\n' );
  fprintf ( 1, '  FILE_NAME_EXT_SWAP changes a file extension.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Input               Output\n' );
  fprintf ( 1, '  FILE_NAME    EXT    FILE_NAME\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    file_name = file_name_test(test,:);
    ext = ext_test(test,:);
    file_name_new = file_name_ext_swap ( file_name, ext );

    fprintf ( 1, '  %s  %s    %s\n',  file_name, ext, file_name_new );

  end

  return
end
