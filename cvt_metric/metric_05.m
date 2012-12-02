function A = metric_05 ( p )

%*****************************************************************************80
%
%% METRIC_05 evaluates metric #5 at any point.
%
%  Discussion:
%
%    This routine evaluates the matrix that determines the metric
%    at a point.
%
%    It is not diagonal.
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
  A = [ 2.0, 3.0; 3.0, 5.0 ];

  return
end
