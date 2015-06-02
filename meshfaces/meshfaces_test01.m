function meshfaces_test01 ( )

%*****************************************************************************80
%
%% MESHFACES_TEST01 applies meshfaces() to a shape with three faces.
%
%  Discussion:
%
%    This diagram suggests how the square [0,4]x[0,4] has been subdivided
%    into three regions for which a mesh is desired:
%
%    6----5---4------3
%    |    |   |      |
%    |    7---8      |
%    |   /           |
%    |  /            |
%    | /             |
%    1---------------2
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
  fprintf ( 1, 'MESHFACES_TEST01:\n' );
  fprintf ( 1, '  Apply meshfaces() to a shape with three faces.\n' );

  node = [ ...
    0.0, 0.0;
    4.0, 0.0;
    4.0, 4.0;
    3.0, 4.0;
    2.0, 4.0;
    0.0, 4.0;
    2.0, 3.0;
    3.0, 3.0 ];

  edge = [ ...
    1, 2; ...
    2, 3; ...
    3, 4; ...
    4, 5; ...
    5, 6; ...
    6, 1; ...
    5, 7; ...
    7, 8; ...
    8, 4; ...
    7, 1 ];
    
  face{1} = [ 1, 2, 3, 9, 8, 10 ];
  face{2} = [10, 7, 5, 6 ];
  face{3} = [ 8, 9, 4, 7 ];

  hdata = [];
  options = [];

  [ p, t, fnum, stats ] = meshfaces ( node, edge, face, hdata, options )

  filename = 'test01.png';

  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A copy of the mesh saved as "%s"\n', filename );

  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  %d nodes\n', np );
  fprintf ( 1, '  %d triangles\n', nt );

  return
end

