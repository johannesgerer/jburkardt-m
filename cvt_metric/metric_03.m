function A = metric_03 ( p )

%*****************************************************************************80
%
%% METRIC_03 evaluates metric #3 at any point.
%
%  Discussion:
%
%    This routine evaluates the matrix that determines the metric
%    at a point.
%
%    This particular matrix exaggerates distances in the Y direction.
%
%    It is diagonal, and it is spatially constant.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 May 2006
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
  A = [ 1.0, 0.0; 0.0, 100.0 ];

  return
end
