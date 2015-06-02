function spy_file ( header, data_filename )

%*****************************************************************************80
%
%% SPY_FILE plots a sparsity pattern stored in a file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string HEADER, the name to be used for the
%    title of the plot, and as part of the names of the command
%    and plot files.
%
%    Input, string DATA_FILENAME, the name of the file
%    containing the indices of nonzero matrix entries.
%
  i4_huge = 2147483647;

  nz_num = 0;

  index = load ( data_filename );

  [ nz_num, ~ ] = size ( index );
  m0 = min ( index(:,1) );
  m1 = max ( index(:,1) );
  n0 = min ( index(:,2) );
  n1 = max ( index(:,2) );
%
%  Create command file.
%
  command_filename = strcat ( header, '_commands.txt' );
  command_unit = fopen ( command_filename, 'wt' );

  fprintf ( command_unit, '# %s\n', command_filename );
  fprintf ( command_unit, '#\n' );
  fprintf ( command_unit, '# Usage:\n' );
  fprintf ( command_unit, '#  gnuplot < %s\n', command_filename );
  fprintf ( command_unit, '#\n' );
  fprintf ( command_unit, 'unset key\n' );
  fprintf ( command_unit, 'set term png\n' );

  png_filename = strcat ( header, '.png' );
  fprintf ( command_unit, 'set output "%s"\n', png_filename );
  fprintf ( command_unit, 'set size ratio -1\n' );
  fprintf ( command_unit, 'set xlabel "<--- J --->"\n' );
  fprintf ( command_unit, 'set ylabel "<--- I --->"\n' );
  
  fprintf ( command_unit, 'set title "%d nonzeros for ''%s''"\n', nz_num, header );
  fprintf ( command_unit, 'set timestamp\n' );
  fprintf ( command_unit, 'plot [y=%d:%d] [x=%d:%d] "%s" with points pt 5\n', ...
    m0, m1, n0, n1, data_filename );

  fclose ( command_unit );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created graphics command file "%s".\n', command_filename );

  return
end
