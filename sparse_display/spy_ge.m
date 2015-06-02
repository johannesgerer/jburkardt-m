function spy_ge ( m, n, a, header )

%*****************************************************************************80
%
%% SPY_GE plots a sparsity pattern for a general storage (GE) matrix.
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
%    Input, integer M, N, the number of rows and columns
%    in the matrix.
%
%    Input, real A(M,N), the matrix.
%
%    Input, string HEADER, the name to be used for the
%    title of the plot, and as part of the names of the data, command
%    and plot files.
%

%
%  Create data file.
%
  data_filename = strcat ( header, '_data.txt' );
  data_unit = fopen ( data_filename, 'wt' );
  nz_num = 0;
  for j = 1 : n
    for i = 1 : m
      if ( a(i,j) ~= 0.0 )
        fprintf ( data_unit, '%d  %d\n', j, i );
        nz_num = nz_num + 1;
      end
    end
  end
  fclose ( data_unit );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created sparsity data file "%s".\n', data_filename );
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
  fprintf ( command_unit, 'plot [y=1:%d] [x=%d:1] "%s" with points pt 5\n', ...
    n, m, data_filename );

  fclose ( command_unit );
  fprintf ( 1, '  Created graphics command file "%s".\n', command_filename );

  return
end
