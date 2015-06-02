function square_border ( )

%*****************************************************************************80
%
%% SQUARE_BORDER tests MESHFACES on a square in a square.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 March 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SQUARE_BORDER:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate MESHFACES on an square in a square.\n' );
  fprintf ( 1, '  We want to mesh two adjacent regions in such a way\n' );
  fprintf ( 1, '  that the meshes use common nodes on their interface.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Instead of using MESH2D, we need to used MESHFACES.\n' );
%
%  Here are all the nodes to be used.
%
  node = [ 
    0.0, 0.0; 
    6.0, 0.0; 
    6.0, 5.0; 
    0.0, 5.0; 
    1.0, 1.0;
    4.0, 1.0;
    4.0, 4.0;
    1.0, 4.0 ];
%
%  Here are all the edges.
%
  edge = [
    1,2;
    2,3;
    3,4;
    4,1;
    5,6;
    6,7;
    7,8;
    8,5 ];
%
%  Face 1 is the outer strip.
%  Face 2 is the inner square.
%
  face{1} = [1,2,3,4,5,6,7,8];
  face{2} = [5,6,7,8];
%
%  HDATA allows us to set options.
%    HDATA.HMAX is the maximum triangle side length.
%
  hdata = [];
  hdata.hmax = 0.5;
%
%  MESHFACES output is:
%
%    P     = Nx2 array of nodal XY co-ordinates.
%    T     = Mx3 array of triangles as indicies into P, defined with a
%            counter-clockwise node ordering.
%    FNUM  = Mx1 array of face numbers for each triangle in T.
%
  [ p, t, fnum, stats ] = meshfaces ( node, edge, face, hdata );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SQUARE_BORDER:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end

