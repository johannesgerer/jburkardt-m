function [ pp, ivis ] = plane_exp_project_3d ( p1, p2, p3, pf, n, po )

%*****************************************************************************80
%
%% PLANE_EXP_PROJECT_3D projects points through a point onto a plane in 3D.
%
%  Discussion:
%
%    The explicit form of a plane in 3D is
%
%      the plane through P1, P2 and P3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(3), P2(3), P3(3), three points on the plane.
%
%    Input, real PF(3), the focus point.
%
%    Input, integer N, the number of points to project.
%
%    Input, real PO(3,N), the object points.
%
%    Output, real PP(3,N), are the 
%    coordinates of the projections of the object points through the focus
%    point onto the plane.  PP may share the same memory as PO,
%    in which case the projections will overwrite the original data.
%
%    Output, integer IVIS(N), visibility indicator:
%    3, the object was behind the plane;
%    2, the object was already on the plane;
%    1, the object was between the focus and the plane;
%    0, the line from the object to the focus is parallel to the plane,
%    so the object is "invisible".
%    -1, the focus is between the object and the plane.  The object
%    might be considered invisible.
%
  dim_num = 3;
%
%  Put the plane into ABCD form.
%
  [ a, b, c, d ] = plane_exp2imp_3d ( p1, p2, p3 );
%
%  Get the nearest point on the plane to the focus.
%
  pn = plane_imp_point_near_3d ( a, b, c, d, pf );
%
%  Get the distance from the focus to the plane.
%
  disfn = sqrt ( sum ( ( pf(1:dim_num) - pn(1:dim_num) ).^2 ) );
%
%  If the focus lies in the plane, this is bad.  We could still
%  project points that actually lie in the plane, but we'll
%  just bail out.
%
  if ( disfn == 0.0 )
    ivis(1:n) = 0;
    for i = 1 : dim_num
      pp(i,1:n) = pf(i);
    end
    return
  end
%
%  Process the points.
%
  for i = 1 : n
%
%  Get the distance from the focus to the object.
%
    disfo = sqrt ( sum ( ( po(1:dim_num,i)' - pf(1:dim_num) ).^2 ) );

    if ( disfo == 0.0 )
      ivis(i) = 0;
      pp(1:dim_num,i) = pn(1:dim_num);
    else
%
%  Compute ALPHA, the angle between (OBJECT-FOCUS) and (NEAREST-FOCUS).
%
      alpha = angle_rad_3d ( po(1:3,i)', pf(1:3), pn(1:3) );

      if ( cos ( alpha ) == 0.0 )
        ivis(i) = 0;
        pp(1:dim_num,i) = pn(1:dim_num);
      else
%
%  BETA is Dist(NEAREST-FOCUS) / ( Cos(ALPHA)*Dist(OBJECT-FOCUS) )
%
        beta = disfn / ( cos ( alpha ) * disfo );

        if ( 1.0 < beta )
          ivis(i) = 1;
        elseif ( beta == 1.0 )
          ivis(i) = 2;
        elseif ( 0.0 < beta )
          ivis(i) = 3;
        else
          ivis(i) = -1;
        end
%
%  Set the projected point.
%
        pp(1:dim_num,i) = pf(1:dim_num)' + beta * ( po(1:dim_num,i) - pf(1:dim_num)' );

      end
    end
  end

  return
end
