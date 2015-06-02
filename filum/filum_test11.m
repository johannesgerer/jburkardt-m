function filum_test11 ( )

%*****************************************************************************80
%
%% TEST11 tests FILENAME_DEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2008
%
%  Author:
%
%    John Burkardt
%
  ntest = 4;

  string(1,1:11) = 'file???.dat';
  string(2,1:11) = 'file072.dat';
  string(3,1:11) = '2cat9.dat  ';
  string(4,1:11) = 'fred99.txt ';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST11\n' );
  fprintf ( 1, '  FILENAME_DEC decrements a string\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     Input             Output\n' );


  for i = 1 : ntest
    fprintf ( 1, '\n' );
    filename = string(i,:);
    for j = 1 : 3
      filename_old = filename;
      filename = filename_dec ( filename );
      fprintf ( 1, '  %20s  %20s\n', filename_old, filename );
      if ( s_len_trim ( filename ) == 0 )
        fprintf ( 1, '  (Empty output string.  Quit loop!)\n' );
        break
      end
    end
  end

  return
end
