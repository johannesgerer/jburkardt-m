function ell_demo ( )

%*****************************************************************************80
%
%% ELL_DEMO demonstrates MESH2D on the L-shaped region.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ELL_DEMO:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Use MESH2D to mesh the L-shaped region.\n' );
  fprintf ( 1, '  Use MESH2D_TO_MEDIT to write the mesh to a file.\n' );

  warning off

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Set maximum element size HDATA.HMAX = 0.1\n' );

  v = [ 0.0, 0.0; 2.0, 0.0; 2.0, 1.0; 1.0, 1.0; 1.0, 2.0; 0.0, 2.0 ];

  hdata = [];
  hdata.hmax = 0.1;

  [ p, t ] = mesh2d ( v, [], hdata );

  [ nv, ~ ] = size ( v );
  [ np, ~ ] = size ( p );
  [ nt, ~ ] = size ( t );
  fprintf ( 1, '  %d boundary vertices input, %d nodes and %d triangles created\n', nv, np, nt );
  pause
%
%  Now call MESH2D_TO_MEDIT to write the data to a file.
%
  filename = 'ell.mesh';
  mesh2d_to_medit ( p, t, filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote mesh data to MEDIT mesh file "%s"\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ELL_DEMO:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
function h = hfun1 ( x, y )

%*****************************************************************************80
%
%% HFUN1 is a size-function for the L-shaped region.
%
%  Discussion:
%
%    The smallest size is at (1.0,1.0), and sizes increase as their distance
%    from that point increases.
%
  h = 0.01 + 0.1 * sqrt ( ( x - 1.0 ).^2  + ( y - 1.0 ).^2 );

  return
end
