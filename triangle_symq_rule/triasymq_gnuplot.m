function triasymq_gnuplot ( vert1, vert2, vert3, numnodes, rnodes, header )

%*****************************************************************************80
%
%% TRIASYMQ_GNUPLOT: set up a GNUPLOT plot of the triangle quadrature rule.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    11 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Hong Xiao, Zydrunas Gimbutas,
%    A numerical algorithm for the construction of efficient quadrature
%    rules in two and higher dimensions,
%    Computers and Mathematics with Applications,
%    Volume 59, 2010, pages 663-676.
%
%  Parameters:
%
%    Input, real VERT1(2), VERT2(2), VERT3(2), the vertices
%    of the triangle.
%
%    Input, real NUMNODES, the number of nodes.
%
%    Input, real RNODES(2,NUMNODES), the coordinates of
%    the nodes.
%
%    Input, string HEADER, a string to be used to identify the files created.
%

%
%  Create the vertex file.
%
  vertex_filename = strcat ( header, '_vertices.txt' );
  vertex_unit = fopen ( vertex_filename, 'wt' );
  fprintf ( vertex_unit, '%g  %g\n', vert1(1), vert1(2) );
  fprintf ( vertex_unit, '%g  %g\n', vert2(1), vert2(2) );
  fprintf ( vertex_unit, '%g  %g\n', vert3(1), vert3(2) );
  fprintf ( vertex_unit, '%g  %g\n', vert1(1), vert1(2) );
  fclose ( vertex_unit );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created vertex file "%s".\n', vertex_filename );
%
%  Create node file.
%
  node_filename = strcat ( header, '_nodes.txt' );
  node_unit = fopen ( node_filename, 'wt' );
  for j = 1 : numnodes
    fprintf ( node_unit, '%g  %g\n', rnodes(1:2,j) );
  end
  fclose ( node_unit );
  fprintf ( 1, '  Created node file "%s".\n', node_filename );
%
%  Create graphics command file.
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
  fprintf ( command_unit, 'set title "%s"\n', header );
  fprintf ( command_unit, 'set grid\n' );
  fprintf ( command_unit, 'set key off\n' );
  fprintf ( command_unit, 'set size ratio -1\n' );
  fprintf ( command_unit, 'set style data lines\n' );
  fprintf ( command_unit, 'set timestamp\n' );
  fprintf ( command_unit, 'plot "%s" with lines lw 3, \\\n', vertex_filename );
  fprintf ( command_unit, '     "%s" with points pt 7 lt 0\n', node_filename );
  fclose ( command_unit );

  fprintf ( 1, '  Created command file "%s".\n', command_filename );

  return
end
