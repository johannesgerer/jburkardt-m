function simp_plot_2d ( p, t )

%*****************************************************************************80
%
%% SIMP_PLOT_2D displays a plot of the triangles that form a mesh in 2D.
%
%  Licensing:
%
%    (C) 2004 Per-Olof Persson. 
%    See COPYRIGHT.TXT for details.
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
%    Input, real P(NP,2), the coordinates of a set of nodes in 2D.
%
%    Input, integer T(NT,3), a list of the nodes which make up each triangle in the mesh.
%
  h = trimesh ( t, p(:,1), p(:,2), 0*p(:,1), ...
    'facecolor', 'none', 'edgecolor', 'k' );

  view ( 2 )
  axis equal
  axis off

  return
end

