function p15_demo ( iteration_max, h )

%*****************************************************************************80
%
%% P15_DEMO runs the 2D demo problem #15, with mesh size H.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2006
%
%  Reference:
%
%    Per-Olof Persson and Gilbert Strang,
%    A Simple Mesh Generator in MATLAB,
%    SIAM Review,
%    Volume 46, Number 2, June 2004, pages 329-345.
%
%  Parameters:
%
%    Input, integer ITERATION_MAX, the maximum number of iterations that DISTMESH
%    should take.  (The program might take fewer iterations if it detects convergence.)
%
%    Input, real H, the mesh spacing parameter.
%
  if ( nargin < 1 )
    iteration_max = 50;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P15_DEMO - Note:\n' );
    fprintf ( 1, '  No value of ITERATION_MAX was supplied.\n' );
    fprintf ( 1, '  The default value ITERATION_MAX = %d will be used.\n', ...
      iteration_max );
  end

  if ( nargin < 2 )
    h = 0.20;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P15_DEMO - Note:\n' );
    fprintf ( 1, '  No value of H was supplied.\n' );
    fprintf ( 1, '  The default value H = %f will be used.\n', h );
  end
%
%  Put the random number generator into a fixed initial state.
%
  rand ( 'state', 111 );
%
%  Set the rendering method for the current figure to Z-buffering.
%
  set ( gcf, 'rend', 'z' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Problem 15:\n' );
  fprintf ( 1, '  Sangbum Kim''s forward step, h = %f\n', h )

  fd = @p15_fd;
  fh = @p15_fh;

  box = [ -8.0, -1.0; ...
           8.0,  1.0 ];

  fixed = [ -8.0, -1.0; ...
             2.0, -1.0; ...
             2.0,  0.0; ...
             8.0,  0.0; ...
             8.0,  1.0; ...
            -2.0,  1.0; ...
            -2.0,  0.0; ...
            -8.0,  0.0 ];

  [ p, t ] = distmesh_2d ( fd, fh, h, box, iteration_max, fixed );

  post_2d ( p, t, fh )
%
%  Write a PostScript image of the triangulation.
%
  [ node_num, junk ] = size ( p );
  [ tri_num, junk ] = size ( t );
  p = p';
  t = t';
  node_show = 0;
  triangle_show = 1;

  triangulation_order3_plot ( 'p15_mesh.eps', node_num, p, tri_num, ...
    t, node_show, triangle_show );
%
%  Write a text file containing the nodes.
%
  r8mat_write ( 'p15_nodes.txt', 2, node_num, p );
%
%  Write a text file containing the triangles.
%
  i4mat_write ( 'p15_elements.txt', 3, tri_num, t );

  return
end
