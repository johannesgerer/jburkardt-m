function simp_plot_3d ( p, t, expr, bcolor, icolor )

%*****************************************************************************80
%
%% SIMP_PLOT_3D displays a plot of the tetrahedrons that form a mesh in 3D.
%
%  Licensing:
%
%    (C) 2004 Per-Olof Persson. 
%    See COPYRIGHT.TXT for details.
%
%  Modified:
%
%    11 September 2005
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
%    Input, real P(NP,3), the coordinates of a set of nodes in 3D.
%
%    Input, integer T(NT,1:4), a list of the nodes which make up each tetrahedron in the mesh.
%
%    Input, ? EXPR, ?
%
%    Input, real BCOLOR(3), the RGB color to use for faces.
%
%    Input, real ICOLOR(3), the RGB color to use for selected faces.
%
  if ( nargin < 4 )
    bcolor = 0.9 * ones ( 1, 3 );
  end

  if ( nargin < 5 )
    icolor = 0.6 * ones ( 1, 3 ); 
  end

  tri1 = surftri ( p, t );

  if 2 < nargin & ~isempty ( expr )
    incl = find ( eval(expr) );
    t = t(any(ismember(t,incl),2),:);
    tri1 = tri1(any(ismember(tri1,incl),2),:);
    tri2 = surftri ( p, t );
    tri2 = setdiff ( tri2, tri1, 'rows' );
    h = trimesh ( tri2, p(:,1), p(:,2), p(:,3) );
    set ( h, 'facecolor', icolor, 'edgecolor', 'k' );
    hold on
  end

  h = trimesh ( tri1, p(:,1), p(:,2), p(:,3) );
  hold off
  set ( h, 'facecolor', bcolor, 'edgecolor', 'k' );
  axis equal
  cameramenu

  return
end
