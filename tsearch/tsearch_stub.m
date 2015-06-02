function k = tsearch(x,y,tri,xi,yi)
%TSEARCH Search for enclosing Delaunay triangle
%
% TSEARCH will be removed in a future release.
% Use DelaunayTri/pointLocation instead.
%
% T = TSEARCH(X,Y,TRI,XI,YI) returns the index of the enclosing Delaunay
% triangle for each point in XI,YI so that the enclosing triangle for
% point (XI(k),YI(k)) is TRI(T(k),:). TSEARCH returns NaN for all
% points outside the convex hull. Requires a triangulation TRI of the
% points X,Y obtained from DELAUNAY.
%
% See also DelaunayTri, DELAUNAY, TSEARCHN, DELAUNAYN.

% Relies on the MEX file tsrchmx to do most of the work.

% Copyright 1984-2009 The MathWorks, Inc.
% $Revision: 1.17.4.7 $ $Date: 2010/08/23 23:12:06 $

warning(message('MATLAB:tsearch:DeprecatedFunction'));

% Create TriangleGraph which is a sparse connectivity matrix
ntri = size(tri,1);
triangle_graph = sparse( repmat((1:ntri)',1,3), tri, 1, ntri, numel(x));

% call tsrchmx to do the work
%X, Y are treated as vectors inside mex function
k = tsrchmx(x,y,tri,xi,yi,triangle_graph);



