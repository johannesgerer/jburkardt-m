function pyramid_unit_grid_plot ( n, ng, pg, header )

%*****************************************************************************80
%
%% PYRAMID_UNIT_GRID_PLOT sets up a GNUPLOT plot of a unit pyramid grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of subintervals.
%
%    Input, integer NG, the number of nodes to generate,
%    as determined by pyramid_grid_size().
%
%    Input, real PG(3,NG), the grid point coordinates.
%
%    Input, character ( len = * ) HEADER, the header for the files.
%

%
%  Create the vertex file.
%
  [ v1, v2, v3, v4, v5 ] = pyramid_unit_vertices ( );

  vertex_filename = strcat ( header, '_vertices.txt' );
  vertex_unit = fopen ( vertex_filename, 'wt' );

  fprintf ( vertex_unit, '%g  %g  %g\n', v2(1), v2(2), v2(3) );
  fprintf ( vertex_unit, '%g  %g  %g\n', v3(1), v3(2), v3(3) );
  fprintf ( vertex_unit, '%g  %g  %g\n', v4(1), v4(2), v4(3) );
  fprintf ( vertex_unit, '%g  %g  %g\n', v5(1), v5(2), v5(3) );
  fprintf ( vertex_unit, '%g  %g  %g\n', v2(1), v2(2), v2(3) );
  fprintf ( vertex_unit, '\n' );

  fprintf ( vertex_unit, '%g  %g  %g\n', v1(1), v1(2), v1(3) );
  fprintf ( vertex_unit, '%g  %g  %g\n', v2(1), v2(2), v2(3) );
  fprintf ( vertex_unit, '\n' );

  fprintf ( vertex_unit, '%g  %g  %g\n', v1(1), v1(2), v1(3) );
  fprintf ( vertex_unit, '%g  %g  %g\n', v3(1), v3(2), v3(3) );
  fprintf ( vertex_unit, '\n' );

  fprintf ( vertex_unit, '%g  %g  %g\n', v1(1), v1(2), v1(3) );
  fprintf ( vertex_unit, '%g  %g  %g\n', v4(1), v4(2), v4(3) );
  fprintf ( vertex_unit, '\n' );

  fprintf ( vertex_unit, '%g  %g  %g\n', v1(1), v1(2), v1(3) );
  fprintf ( vertex_unit, '%g  %g  %g\n', v5(1), v5(2), v5(3) );

  fclose ( vertex_unit );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created vertex file "%s"\n', vertex_filename );
%
%  Create the node file.
%
  node_filename = strcat ( header, '_nodes.txt' );
  node_unit = fopen ( node_filename, 'wt' );
  for j = 1 : ng
    fprintf ( node_unit, '%g  %g  %g\n', pg(1:3,j) );
  end
  fclose ( node_unit );
  fprintf ( 1, '  Created node file "%s"\n', node_filename );
%
%  Create the command file.
%
  command_filename = strcat ( header, '_commands.txt' );
  command_unit = fopen ( command_filename, 'wt' );
  fprintf ( command_unit, '# %s\n', command_filename );
  fprintf ( command_unit, '#\n' );
  fprintf ( command_unit, '# Usage:\n' );
  fprintf ( command_unit, '#  gnuplot < %s\n', command_filename );
  fprintf ( command_unit, '#\n' );
  fprintf ( command_unit, 'set term png\n' );
  plot_filename = strcat ( header, '.png' );
  fprintf ( command_unit, 'set output "%s"\n', plot_filename );
  fprintf ( command_unit, 'set xlabel "<--- X --->"\n' );
  fprintf ( command_unit, 'set ylabel "<--- Y --->"\n' );
  fprintf ( command_unit, 'set zlabel "<--- Z --->"\n' );
  fprintf ( command_unit, 'set title "%s"\n', header );
  fprintf ( command_unit, 'set grid\n' );
  fprintf ( command_unit, 'set key off\n' );
  fprintf ( command_unit, 'set view equal xyz\n' );
  fprintf ( command_unit, 'set view 80, 40\n' );
  fprintf ( command_unit, 'set style data lines\n' );
  fprintf ( command_unit, 'set timestamp\n' );
  fprintf ( command_unit, 'splot "%s" with lines lw 3, \\\n', vertex_filename );
  fprintf ( command_unit, '      "%s" with points pt 7 lt 0\n', node_filename );
  fclose ( command_unit );

  fprintf ( 1, '  Created command file "%s"\n', command_filename );

  return
end
