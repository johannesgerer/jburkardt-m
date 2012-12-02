function b = tmat_rot_axis ( a, angle, axis )

%*****************************************************************************80
%
%% TMAT_ROT_AXIS applies a coordinate axis rotation to the geometric transformation matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Foley, van Dam, Feiner, Hughes,
%    Computer Graphics, Principles and Practice,
%    Addison Wesley, Second Edition, 1990.
%
%  Parameters:
%
%    Input, real A(4,4), the current geometric transformation
%    matrix.
%
%    Input, real ANGLE, the angle, in degrees, of the rotation.
%
%    Input, character AXIS, is 'X', 'Y' or 'Z', specifying the coordinate
%    axis about which the rotation occurs.
%
%    Output, real B(4,4), the modified geometric 
%    transformation matrix.  
%
  angle_rad = degrees_to_radians ( angle );

  c = tmat_init ( );

  if ( axis == 'X' | axis == 'x' )
    c(2,2) =   cos ( angle_rad );
    c(2,3) = - sin ( angle_rad );
    c(3,2) =   sin ( angle_rad );
    c(3,3) =   cos ( angle_rad );
  elseif ( axis == 'Y' | axis == 'y' )
    c(1,1) =   cos ( angle_rad );
    c(1,3) =   sin ( angle_rad );
    c(3,1) = - sin ( angle_rad );
    c(3,3) =   cos ( angle_rad );
  elseif ( axis == 'Z' | axis == 'z' )
    c(1,1) =   cos ( angle_rad );
    c(1,2) = - sin ( angle_rad );
    c(2,1) =   sin ( angle_rad );
    c(2,2) =   cos ( angle_rad );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TMAT_ROT_AXIS - Fatal error!\n' );
    fprintf ( 1, '  Illegal rotation axis: %c\n', axis )
    fprintf ( 1, '  Legal choices are ''X'', ''Y'', or ''Z''.\n' );
    error ( 'TMAT_ROT_AXIS - Fatal error!' );
  end

  b(1:4,1:4) = c(1:4,1:4) * a(1:4,1:4);

  return
end
