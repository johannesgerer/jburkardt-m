function meshfaces_test03 ( )

%*****************************************************************************80
%
%% MESHFACES_TEST03: Circle in a square.
%
%  Modified:
%
%    23 August 2014
%
%  Author:
%
%    Darren Engwirda
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MESHFACES_TEST03\n' );
  fprintf ( 1, '  Draw a circle inside a square.\n' );
  fprintf ( 1, '  Mesh both regions.\n' );

  dtheta = pi/36;
  theta = (-pi:dtheta:(pi-dtheta))';
  node1 = [cos(theta), sin(theta)];
  node2 = [-2.0,-2.0; 2.0,-2.0; 2.0,2.0; -2.0, 2.0];
  edge1 = [(1:size(node1,1))',[(2:size(node1,1))'; 1]];
  edge2 = [1,2; 2,3; 3,4; 4,1];

  edge = [edge1; edge2+size(node1,1)];
  node = [node1; node2];

  face{1} = 1:size(edge1,1);
  face{2} = 1:size(edge,1);
%
%  Calling with no output arguments means we will simply see an image
%  of the mesh.
%
  meshfaces ( node, edge, face );

  filename = 'test03.png'
  print ( '-dpng', filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  An image of the mesh was saved as "%s"\n', filename );

  return
end
