function A = metric_02 ( p )

%*****************************************************************************80
%
%% METRIC_02 evaluates metric #2 at any point.
%
%  Discussion:
%
%    This routine evaluates the matrix that determines the metric
%    at a point.
%
%    This particular matrix exaggerates distances in the X direction.
%
%    It is diagonal, and it is spatially constant.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 May 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P(2), the point at which the metric matrix is to
%    be evaluated.
%
%    Output, real A[2,2], the metric matrix.
%
  A = [ 9.0, 0.0; 0.0, 1.0 ];

  return
end
