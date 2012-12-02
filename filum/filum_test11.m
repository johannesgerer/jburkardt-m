function filum_test11 ( )

%*****************************************************************************80
%
%% TEST11 tests FILE_NAME_DEC.
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
  fprintf ( 1, '  FILE_NAME_DEC decrements a string\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     Input             Output\n' );


  for i = 1 : ntest
    fprintf ( 1, '\n' );
    file_name = string(i,:);
    for j = 1 : 3
      file_name_old = file_name;
      file_name = file_name_dec ( file_name );
      fprintf ( 1, '  %20s  %20s\n', file_name_old, file_name );
      if ( s_len_trim ( file_name ) == 0 )
        fprintf ( 1, '  (Empty output string.  Quit loop!)\n' );
        break
      end
    end
  end

  return
end
