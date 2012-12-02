function post_3d ( p, t )

%*****************************************************************************80
%
%% POST_3D is a postprocessor for the tetrahedronal mesh.
%
%  Copyright:
%
%    (C) 2004 Per-Olof Persson. 
%    See COPYRIGHT.TXT for details.
%
%  Modified:
%
%    31 July 2009
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
%    Input, P(N,3), the coordinates of nodes.
%
%    Input, integer T(NT,4), the indices of nodes that make up the tetrahedrons.
%
  [ node_num, junk ] = size ( p );
  [ tetra_num, junk ] = size ( t );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  %d nodes were used.\n', node_num );
  fprintf ( 1, '  %d tetrahedrons were created.\n', tetra_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  QUALITY MEASURES:\n');
  fprintf ( 1, '  A value of 1.00 is best, and 0.00 is the worst.\n' );

  q = simp_qual_3d ( p, t, 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Measure Min         Mean        Max         Var\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  #1  %10f  %10f  %10f  %10f\n', ...
    min ( q ), mean ( q ), max ( q ), var ( q ) );

  bad = find ( q == min ( q ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The tetrahedron of minimum quality is number %d\n', bad(1) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Node        X             Y             Z\n' );
  fprintf ( 1, '\n' );

  for j = 1 : 4
    n = t(bad(1),j);
    fprintf ( 1, '  %4d  %12f  %12f  %12f\n',  n, p(n,1:3) );
  end
      
  return
end
