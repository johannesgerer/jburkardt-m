%% POWER_WRITE writes a power table to a file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POWER_WRITE\n' );
  fprintf ( 1, '  Write a table of integer powers to a file.\n' );

  file_name = 'power_write.txt';

  file_unit = fopen ( file_name, 'w' );

  fprintf ( file_unit, '\n' );
  fprintf ( file_unit, '           N   N-squared     N-cubed\n' );
  fprintf ( file_unit, '\n' );
  for i = 0 : 10
    fprintf ( file_unit, '  %10d  %10d  %10d\n', i, i^2, i^3 );
  end
 
  fclose ( file_unit );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  POWER_WRITE wrote the file %s\n', file_name );

  exit
