function value = gpl_classify ( filename )

%*****************************************************************************80
%
%% GPL_CLASSIFY tries to classify a GPL file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILENAME, the name of the GPL file.
%
%    Output, integer VALUE, defines the type of the GPL file.
%    -1, unknown.
%     1, a single curve in 2D.
%     2, multiple curves in 2D.
%     3, a single curve in 3D.
%     4, a surface Z(X,Y) defined on a rectangular grid.
%     5, a surface Z(X,Y) defined by unordered rectangles.
%     6, a surface Z(X,Y) defined by triangles.
%
  value = -1;
%
%  Determine dimensionality of data.
%
  d = gpl_dimension ( filename );

  return
end
