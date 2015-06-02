function meshfaces_test02 ( )

%*****************************************************************************80
%
%% MESHFACES_TEST02: A rectangle is subdivided into three.
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
  fprintf ( 1, 'MESHFACES_TEST02\n' );
  fprintf ( 1, '  A rectangle is subdivided into three.\n' );
  fprintf ( 1, '  The middle rectangle is thin.\n' );

  node = [0.0, 0.0; 1.0,0.0; 1.0,1.0; 0.0,1.0; 1.01,0.0; 1.01,1.0; 3.0,0.0; 3.0,1.0];
  edge = [1,2; 2,3; 3,4; 4,1; 2,5; 5,6; 6,3; 5,7; 7,8; 8,6];

  face{1} = [1,2,3,4];
  face{2} = [5,6,7,2];
  face{3} = [8,9,10,6];
%
%  Since we don't save the output, we will just see an image of the mesh.
%
  meshfaces ( node, edge, face );

  filename = 'test02.png'
  print ( '-dpng', filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  An image of the mesh was saved as "%s"\n', filename );

  return
end
