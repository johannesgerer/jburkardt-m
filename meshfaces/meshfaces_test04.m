function meshfaces_test04 ( )

%*****************************************************************************80
%
%% MESHFACES_TEST04 applies meshfaces() to a schematic battery.
%
%  Discussion:
%
%    8  +------------------+
%       |                  |
%    7  +---------------+  |
%       |               |  |
%    6  +--------+---+  |  |
%       |        |   |  |  |
%    5  +--------+   |  |  |
%       |        |   |  |  |
%    4  +--------+   |  |  |
%       |        |   |  |  |
%    3  +--------+   |  |  |
%       |        |   |  |  |
%    2  +--------+---+--+  |
%       |                  |
%    1  +------------------+
%       1        2   3  4  5
%
%    The rectangular subdomains are characterized by 5 X values:
%      0.0, 6.1, 6.5, 8.0, 8.4
%    and 8 Y values:
%      0.0, 0.8, 1.6, 3.6, 18.8, 21.2, 23.2, 24.0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 August 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESHFACES_TEST04:\n' );
  fprintf ( 1, '  Apply meshfaces() to a schematic battery.\n' );
  fprintf ( 1, '  The battery shape is subdivided into seven faces.\n' );
  node = [ ...
    0.0,  0.0; ...
    8.4,  0.0; ...
    0.0,  0.8; ...
    6.1,  0.8; ...
    6.5,  0.8; ...
    8.0,  0.8; ...
    0.0,  1.6; ...
    6.1,  1.6; ...
    0.0,  3.6; ...
    6.1,  3.6; ...
    0.0, 18.8; ...
    6.1, 18.8; ...
    0.0, 21.2; ...
    6.1, 21.2; ...
    6.5, 21.2; ...
    0.0, 23.2; ...
    8.0, 23.2; ...
    0.0, 24.0; ...
    8.4, 24.0 ];

  edge = [ ...
     1,  2; ...
     3,  4; ...
     4,  5; ...
     5,  6; ...
     7,  8; ...
     9, 10; ...
    11, 12; ...
    13, 14; ...
    14, 15; ...
    16, 17; ...
    18, 19; ...
     1,  3; ...
     2, 19; ...
     3,  7; ...
     4,  8; ...
     5, 15; ...
     6, 17; ...
     7,  9; ...
     8, 10; ...
     9, 11; ...
    10, 12; ...
    11, 13; ...
    12, 14; ...
    13, 16; ...
    16, 18];
    
  face{1} = [1, 13, 11, 25, 10, 17,  4,  3,  2, 12 ];
  face{2} = [2, 15,  5, 14 ];
  face{3} = [3, 16,  9, 23, 21, 19, 15 ];
  face{4} = [4, 17, 10, 24,  8,  9, 16 ];
  face{5} = [5, 19,  6, 18 ];
  face{6} = [6, 21,  7, 20 ];
  face{7} = [7, 23,  8, 22 ];

  hdata = [];
  options = [];

  [ p, t, fnum, stats ] = meshfaces ( node, edge, face, hdata, options )

  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  %d nodes\n', np );
  fprintf ( 1, '  %d triangles\n', nt );
%
%  Save the plot in a file.
%
  plot_filename = 'test04.png';
  print ( '-dpng', plot_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A copy of the mesh saved as "%s"\n', plot_filename );
%
%  Write nodes to a file.
%
  node_filename = 'test04_nodes.txt';
  node_unit = fopen ( node_filename, 'wt' );
  for i = 1 : np
    fprintf ( node_unit, '%g  %g\n', p(i,1), p(i,2) );
  end
  fclose ( node_unit );

  fprintf ( 1, '  Node coordinates written to "%s"\n', node_filename );
%
%  Write elements to a file.
%
  element_filename = 'test04_elements.txt';
  element_unit = fopen ( element_filename, 'wt' );
  for i = 1 : nt
    fprintf ( element_unit, '%d  %d  %d\n', t(i,1), t(i,2), t(i,3) );
  end
  fclose ( element_unit );

  fprintf ( 1, '  Element definitions written to "%s"\n', element_filename );

  return
end

