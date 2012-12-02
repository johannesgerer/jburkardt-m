function p18_demo ( iteration_max, h )

%*****************************************************************************80
%
%% P18_DEMO runs DISTMESH problem #18 with mesh size H.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 June 2010
%
%  Author:
%
%    John Burkardt
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
    fprintf ( 1, 'P18_DEMO - Note:\n' );
    fprintf ( 1, '  No value of ITERATION_MAX was supplied.\n' );
    fprintf ( 1, '  The default value ITERATION_MAX = %d will be used.\n', ...
      iteration_max );
  end

  if ( nargin < 2 )
    h = 0.10;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P18_DEMO - Note:\n' );
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
  fprintf ( 1, 'Problem 18:\n' );
  fprintf ( 1, '  The dumbbell, h = %f\n', h )
%
%  Choose the uniform or nonuniform meshing option.
%
  uniform = 1;

  fd = @p18_fd;
  if ( uniform )
    fh = @p18_uniform_fh;
  else
    fh = @p18_nonuniform_fh;
  end

  box = [-3.0,-1.0; 3.0,1.0];

  r = 1.0;
  height = 1.0 / 3.0;

  y_corner = height;
  x_corner = 1.0 + r - sqrt ( ( r + height ) * ( r - height ) );

  fixed = [ - x_corner, - y_corner; ...
              x_corner, - y_corner; ...
              x_corner,   y_corner; ...
            - x_corner,   y_corner ];

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

  if ( uniform )
    triangulation_order3_plot ( 'p18_uniform_mesh.eps', node_num, p, tri_num, ...
      t, node_show, triangle_show );
  else
    triangulation_order3_plot ( 'p18_nonuniform_mesh.eps', node_num, p, tri_num, ...
      t, node_show, triangle_show );
  end

  if ( uniform )
    r8mat_write ( 'p18_uniform__nodes.txt', 2, node_num, p );
    i4mat_write ( 'p18_uniform_elements.txt', 3, tri_num, t );
  else
    r8mat_write ( 'p18_nonuniform__nodes.txt', 2, node_num, p );
    i4mat_write ( 'p18_nonuniform_elements.txt', 3, tri_num, t )
  end

  return
end
