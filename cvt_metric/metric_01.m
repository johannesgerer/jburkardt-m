function A = metric_01 ( p )

%*****************************************************************************80
%
%% METRIC_01 evaluates metric #1 at any point.
%
%  Discussion:
%
%    This routine evaluates the matrix that determines the metric
%    at a point.
%
%    This particular matrix is simply the identity.
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
  A = [ 1.0, 0.0; 0.0, 1.0 ];

  return
end
