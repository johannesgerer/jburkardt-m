function [ u, v ] = uv_spiral ( n, x, y, c )

%*****************************************************************************80
%
%% UV_SPIRAL computes a spiral velocity vector field.
%
%  Discussion:
%
%    Note that the continuous velocity field (U,V)(X,Y) that is discretely
%    sampled here satisfies the homogeneous continuity equation, that is,
%    it has zero divergence.  In other words:
%
%      dU/dX + dV/dY = 0.
%
%    This is by construction, since we have
%
%      U(X,Y) =  10 * d/dY ( PHI(X) * PHI(Y) )
%      V(X,Y) = -10 * d/dX ( PHI(X) * PHI(Y) )
%
%    which guarantees zero divergence.
%
%    The underlying function PHI is defined by
%
%      PHI(Z) = ( 1 - cos ( C * pi * Z ) ) * ( 1 - Z )^2
%
%    where C is a parameter.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), Y(N), the coordinates of the evaluation points.
%
%    Input, real C, a parameter, typically between 0 and 2 * PI.
%
%    Output, real U(N), V(N), the velocity components.
%
  u = zeros ( n, 1 );
  v = zeros ( n, 1 );

  u =   10.0 * ( 1.0 - cos ( c * pi * x ) ) ...
           .* ( 1.0 - x ).^2 ...
           .* ( ...
               c * pi * sin ( c * pi * y ) .* ( 1.0 - y ).^2 ...
             - ( 1.0 - cos ( c * pi * y ) ) ...
             .* 2.0 .* ( 1.0 - y ) ...
             );

  v = - 10.0 * ( 1.0 - cos ( c * pi * y ) ) ...
           .* ( 1.0 - y ).^2 ...
           .* ( ...
               c * pi * sin ( c * pi * x ) .* ( 1.0 - x ).^2 ...
             - ( 1.0 - cos ( c * pi * x ) ) ...
             .* 2.0 .* ( 1.0 - x ) ...
             );

  return
end

