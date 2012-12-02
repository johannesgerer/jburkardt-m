function [ n2, pp, thetamin, thetamax ] = sphere_imp_line_project_3d ( r, ...
  center, n, p, maxpnt2 )

%*****************************************************************************80
%
%% SPHERE_IMP_LINE_PROJECT_3D projects a line onto an implicit sphere in 3D.
%
%  Discussion:
%
%    An implicit sphere in 3D satisfies the equation:
%
%      sum ( ( P(1:dim_num) - CENTER(1:dim_num) )**2 ) = R**2
%
%    The line to be projected is specified as a sequence of points.
%    If two successive points subtend a small angle, then the second
%    point is essentially dropped.  If two successive points subtend
%    a large angle, then intermediate points are inserted, so that
%    the projected line stays closer to the sphere.
%
%    Note that if any P coincides with the center of the sphere, then
%    its projection is mathematically undefined.  PP will
%    be returned as the center.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the sphere.  If R is
%    zero, PP will be returned as the center, and if R is
%    negative, points will end up diametrically opposite from where
%    you would expect them for a positive R.
%
%    Input, real CENTER(3), the center of the sphere.
%
%    Input, integer N, the number of points on the line that is
%    to be projected.
%
%    Input, real P(3,N), the coordinates of
%    the points on the line that is to be projected.
%
%    Input, integer MAXPNT2, the maximum number of points on the projected
%    line.  Even if the routine thinks that more points are needed,
%    no more than MAXPNT2 will be generated.
%
%    Output, integer N2, the number of points on the projected line.
%    N2 can be zero, if the line has an angular projection of less
%    than THETAMIN radians.
%
%    Output, real PP(3,N2), the coordinates
%    of the points representing the projected line.  These points lie on the
%    sphere.  Successive points are separated by at least THETAMIN
%    radians, and by no more than THETAMAX radians.
%
%    Input, real THETAMIN, THETAMAX, the minimum and maximum
%    angular projections allowed between successive projected points.
%    If two successive points on the original line have projections
%    separated by more than THETAMAX radians, then intermediate points
%    will be inserted, in an attempt to keep the line closer to the
%    sphere.  If two successive points are separated by less than
%    THETAMIN radians, then the second point is dropped, and the
%    line from the first point to the next point is considered.
%
  dim_num = 3;
%
%  Check the input.
%
  if ( r == 0.0 )
    n2 = 0;
    return
  end

  p1(1:dim_num) = center(1:dim_num);
  p2(1:dim_num) = center(1:dim_num);

  n2 = 0;

  for i = 1 : n

    if ( p(1:dim_num,i) == center(1:dim_num) )

    else

      p1(1:dim_num) = p2(1:dim_num);

      alpha = sqrt ( sum ( ( p(1:dim_num,i) - center(1:dim_num) ).^2 ) );

      p2(1:dim_num) = center(1:dim_num) + r * ( p(1:dim_num,i) - center(1:dim_num) ) / alpha;
%
%  If we haven't gotten any points yet, take this point as our start.
%
      if ( n2 == 0 )

        n2 = n2 + 1;
        pp(1:dim_num,n2) = p2(1:dim_num);
%
%  Compute the angular projection of P1 to P2.
%
      elseif ( 1 <= n2 )

        dot = ( p1(1:dim_num) - center(1:dim_num) ) * ( p2(1:dim_num) - center(1:dim_num) )';

        ang3d = r8_acos (  dot / ( r * r ) );
%
%  If the angle is at least THETAMIN, (or it's the last point),
%  then we will draw a line segment.
%
        if ( thetamin < abs ( ang3d ) | i == n )
%
%  Now we check to see if the line segment is too long.
%
          if ( thetamax < abs ( ang3d ) )

            nfill = floor ( abs ( ang3d ) / thetamax );

            for j = 1 : nfill-1

              pi(1:dim_num) = ( ( nfill - j ) * ( p1(1:dim_num) - center(1:dim_num) ) ...
                           + (         j ) * ( p2(1:dim_num) - center(1:dim_num) ) );

              tnorm = sqrt ( sum ( pi(1:dim_num).^2 ) );

              if ( tnorm ~= 0.0 )
                pi(1:dim_num) = center(1:dim_num) + r * pi(1:dim_num) / tnorm;
                n2 = n2 + 1;
                pp(1:dim_num,n2) = pi(1:dim_num);
              end

            end
          end
%
%  Now tack on the projection of point 2.
%
          n2 = n2 + 1;
          pp(1:dim_num,n2) = p2(1:dim_num);

        end
      end
    end
  end

  return
end
