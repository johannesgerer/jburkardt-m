function filum_test13 ( )

%*****************************************************************************80
%
%% FILUM_TEST13 tests FILENAME_EXT_SWAP.
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

  filename_test(1,1:11) = 'bob.for    ';
  filename_test(2,1:11) = 'bob.bob.bob';
  filename_test(3,1:11) = 'bob.       ';
  filename_test(4,1:11) = 'bob        ';
  filename_test(5,1:11) = '.oops      ';

  ext_test(1,1:3) = 'obj';
  ext_test(2,1:3) = 'txt';
  ext_test(3,1:3) = 'yak';
  ext_test(4,1:3) = 'ps ';
  ext_test(5,1:3) = 'eek';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST13\n' );
  fprintf ( 1, '  FILENAME_EXT_SWAP changes a file extension.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Input               Output\n' );
  fprintf ( 1, '  FILENAME    EXT    FILENAME\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    filename = filename_test(test,:);
    ext = ext_test(test,:);
    filename_new = filename_ext_swap ( filename, ext );

    fprintf ( 1, '  %s  %s    %s\n',  filename, ext, filename_new );

  end

  return
end
