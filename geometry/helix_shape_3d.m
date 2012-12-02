function p = helix_shape_3d ( a, n, r, theta1, theta2 )

%*****************************************************************************80
%
%% HELIX_SHAPE_3D computes points on a helix in 3D.
%
%  Discussion:
%
%    The user specifies the parameters A and R, the first and last
%    THETA values, and the number of equally spaced THETA values
%    at which (X,Y,Z) values are to be computed.
%
%    X = R * COS ( THETA )
%    Y = R * SIN ( THETA )
%    Z = A * THETA
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the rate at which Z advances with THETA.
%
%    Input, integer N, the number of points to compute on the helix.
%
%    Input, real R, the radius of the helix.
%
%    Input, real THETA1, THETA2, the first and last THETA values at
%    which to compute points on the helix.  THETA is measured in
%    radians.
%
%    Output, real P(3,N), the coordinates of points on the helix.
%
  dim_num = 3;

  for i = 1 : n

    if ( n == 1 )
      theta = 0.5 * ( theta1 + theta2 );
    else
      theta = ( ( n - i,    ) * theta1 ...
              + (     i - 1 ) * theta2 ) ...
              / ( n     - 1 );
    end

    p(1,i) = r * cos ( theta );
    p(2,i) = r * sin ( theta );
    p(3,i) = a * theta;

  end

  return
end
