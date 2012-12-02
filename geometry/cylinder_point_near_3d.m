function pn = cylinder_point_near_3d ( p1, p2, r, p )

%*****************************************************************************80
%
%% CYLINDER_POINT_NEAR_3D determines the nearest point on a cylinder to a point in 3D.
%
%  Discussion:
%
%    We are computing the nearest point on the SURFACE of the cylinder.
%
%    The surface of a (right) (finite) cylinder in 3D is defined by an axis,
%    which is the line segment from point P1 to P2, and a radius R.  The points
%    on the surface of the cylinder are:
%    * points at a distance R from the line through P1 and P2, and whose nearest
%      point on the line through P1 and P2 is strictly between P1 and P2,
%    PLUS
%    * points at a distance less than or equal to R from the line through P1
%      and P2, whose nearest point on the line through P1 and P2 is either
%      P1 or P2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(3,1), P2(3,1), the first and last points
%    on the axis line of the cylinder.
%
%    Input, real R, the radius of the cylinder.
%
%    Input, real P(3,1), the point.
%
%    Output, real PN(3,1), the nearest point on the cylinder.
%
  axis(1:3,1) = p2(1:3,1) - p1(1:3,1);
  axis_length = r8vec_norm ( 3, axis );
  axis(1:3,1) = axis(1:3,1) / axis_length;

  axial_component = ( p(1:3,1) - p1(1:3,1) )' * axis;

  off_axis(1:3,1) = p(1:3,1) - p1(1:3,1) ...
    - axial_component * axis(1:3,1);

  off_axis_component = r8vec_norm ( 3, off_axis );
%
%  Case 1: Below bottom cap.
%
  if ( axial_component <= 0.0 )

    if ( off_axis_component <= r )
      pn(1:3,1) = p1(1:3,1) + off_axis(1:3,1);
    else
      pn(1:3,1) = p1(1:3,1) ...
        + ( r / off_axis_component ) * off_axis(1:3,1);
    end
%
%  Case 2: between cylinder planes.
%
  elseif ( axial_component <= axis_length )

    if ( off_axis_component == 0.0 )

      off_axis = r8vec_any_normal ( 3, axis );
      pn(1:3,1) = p(1:3,1) + r * off_axis(1:3,1);

    else

      distance = abs ( off_axis_component - r );

      pn(1:3,1) = p1(1:3,1) + axial_component * axis(1:3,1) ...
        + ( r / off_axis_component ) * off_axis(1:3,1);

      if ( off_axis_component < r )

        if ( axis_length - axial_component < distance )
          distance = axis_length - axial_component;
          pn(1:3,1) = p2(1:3,1) + off_axis(1:3,1);
        end

        if ( axial_component < distance )
          distance = axial_component;
          pn(1:3,1) = p1(1:3,1) + off_axis(1:3,1);
        end

      end

    end
%
%  Case 3: Above the top cap.
%
  elseif ( axis_length < axial_component )

    if ( off_axis_component <= r )
      pn(1:3,1) = p2(1:3,1) + off_axis(1:3,1);
    else
      pn(1:3,1) = p2(1:3,1) ...
        + ( r / off_axis_component ) * off_axis(1:3,1);
    end

  end

  return
end
