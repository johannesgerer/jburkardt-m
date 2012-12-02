function p09_demo ( iteration_max, h )

%*****************************************************************************80
%
%% P09_DEMO runs the 2D demo problem #09, with mesh size H.
%
%  Licensing:
%
%    (C) 2004 Per-Olof Persson. 
%    See COPYRIGHT.TXT for details.
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
    iteration_max = 200;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P09_DEMO - Note:\n' );
    fprintf ( 1, '  No value of ITERATION_MAX was supplied.\n' );
    fprintf ( 1, '  The default value ITERATION_MAX = %d will be used.\n', ...
      iteration_max );
  end

  if ( nargin < 1 )
    h = 0.08;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P09_DEMO - Note:\n' );
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
  fprintf ( 1, 'Problem 09:\n' );
  fprintf ( 1, '  Jeff Borggaard''s square with hexagonal holes, h = %f\n', h )

  hex1 = [ 0.15, 0.75; ...
           0.20, 0.6634; ...
           0.30, 0.6634; ...
           0.35, 0.75; ...
           0.30, 0.8366; ...
           0.20, 0.8366];

  hex2 = [ 0.50, 0.40; ...
           0.55, 0.3134; ...
           0.65, 0.3134; ...
           0.70, 0.40; ...
           0.65, 0.4866; ...
           0.55, 0.4866 ];

  fd = @p09_fd;
  fh = @p09_fh;
  box = [0.0,0.0; 1.0,1.0];

  fixed = [0.0,0.0; 0.0,1.0; 1.0,0.0; 1.0,1.0; hex1; hex2 ];

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

  triangulation_order3_plot ( 'p09_mesh.eps', node_num, p, tri_num, ...
    t, node_show, triangle_show );
%
%  Write a text file containing the nodes.
%
  r8mat_write ( 'p09_nodes.txt', 2, node_num, p );
%
%  Write a text file containing the triangles.
%
  i4mat_write ( 'p09_elements.txt', 3, tri_num, t );

  return
end
