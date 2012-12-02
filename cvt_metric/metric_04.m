function A = metric_04 ( p )

%*****************************************************************************80
%
%% METRIC_04 evaluates metric #4 at any point.
%
%  Discussion:
%
%    This routine evaluates the matrix that determines the metric
%    at a point.
%
%    This particular matrix reduces distances when evaluated far from the origin.
%
%    It is diagonal, and it is spatially varying.
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
  A = [ 1.0, 0.0; 0.0, 1.0 ] * ...
      ( 0.20 + ( sin ( 2 * pi * p(1) ) )^2 * ( sin ( 2 * pi * p(2) ) )^2 );

  return
end
