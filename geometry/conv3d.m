function cor2 = conv3d ( axis, theta, n, cor3 )

%*****************************************************************************80
%
%% CONV3D converts 3D data to a 2D projection.
%
%  Discussion:
%
%    A "presentation angle" THETA is used to project the 3D point
%    (X3D, Y3D, Z3D) to the 2D projection (XVAL,YVAL).
%
%    If AXIS = 'X':
%
%      X2D = Y3D - sin ( THETA ) * X3D
%      Y2D = Z3D - sin ( THETA ) * X3D
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character AXIS, the coordinate axis to be projected.
%    AXIS should be 'X', 'Y', or 'Z'.
%
%    Input, real THETA, the presentation angle in degrees.
%
%    Input, integer N, the number of points.
%
%    Input, real COR3(3,N), the 3D points.
%
%    Output, real COR2(2,N), the 2D projections.
%
  stheta = sin ( degrees_to_radians ( theta ) );

  if ( axis == 'X' | axis == 'x' )

    cor2(1,1:n) = cor3(2,1:n) - stheta * cor3(1,1:n);
    cor2(2,1:n) = cor3(3,1:n) - stheta * cor3(1,1:n);

  elseif ( axis == 'Y' | axis == 'y' )

    cor2(1,1:n) = cor3(1,1:n) - stheta * cor3(2,1:n)
    cor2(2,1:n) = cor3(3,1:n) - stheta * cor3(2,1:n);

  elseif ( axis == 'Z' | axis == 'z' )

    cor2(1,1:n) = cor3(1,1:n) - stheta * cor3(3,1:n);
    cor2(2,1:n) = cor3(2,1:n) - stheta * cor3(3,1:n);

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'CONV3D - Fatal error!\n' );
    fprintf ( 1, '  Illegal coordinate index = "%c".\n', axis );
    error ( 'CONV3D - Fatal error!' );

  end

  return
end
