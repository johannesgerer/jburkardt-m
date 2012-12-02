function filum_test15 ( )

%*****************************************************************************80
%
%% TEST15 tests FILENAME_INC.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST15\n' );
  fprintf ( 1, '  FILENAME_INC "increments" a string.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this example, the string is a file name.\n' );
  fprintf ( 1, '  The user is going to carry out several simulations.\n' );
  fprintf ( 1, '  For each simulation, a consecutive series of file\n' );
  fprintf ( 1, '  names is desired.\n' );

  string1 = 'file_00';
  string2 = '_000.txt';

  for sim = 1 : 5

    string1 = filename_inc ( string1 );

    string = s_cat ( string1, string2 );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Begin simulation %d\n', sim );
    fprintf ( 1, '\n' );

    for time_step = 1 : 4

      string = filename_inc ( string );

      fprintf ( 1, '    %s\n', string );

    end

  end

  return
end
