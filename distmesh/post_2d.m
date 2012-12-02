function post_2d ( p, t, fh, varargin )

%*****************************************************************************80
%
%% POST_2D postprocesses the output from a run of DISTMESH2D.
%
%  Licensing:
%
%    (C) 2004 Per-Olof Persson. 
%    See COPYRIGHT.TXT for details.
%
%  Modified:
%
%    10 February 2006
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
%    Input, real P(NODE_NUM,2), the coordinates of the nodes.
%
%    Input, integer T(TRI_NUM,3), the indices of nodes used to form the triangles.
%
%    Input, external FH, the mesh size function.
%
%    Input, VARARGIN, extra arguments to be passed to UNIFORMITY.
%
  [ node_num, junk ] = size ( p );
  [ tri_num, junk ] = size ( t );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  %d nodes were used.\n', node_num );
  fprintf ( 1, '  %d triangles were created.\n', tri_num );

  q = simpqual ( p, t );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The minimum simplex quality was %.2f\n', min ( q ) );
  fprintf ( 1, '  (A value of 1.00 is best, and 0.00 is the worst.)\n' );

  u = uniformity ( p, t, fh, varargin{:} );

  fprintf ( 1, '  The simplex uniformity was %.1f%%\n', 100 * u );
  fprintf ( 1, '  (A value of 5%% or less is good.)\n' );

  return
end
