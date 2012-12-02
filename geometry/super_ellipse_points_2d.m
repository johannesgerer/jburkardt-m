function p = super_ellipse_points_2d ( center, r1, r2, expo, psi, n )

%*****************************************************************************80
%
%% SUPER_ELLIPSE_POINTS_2D returns N points on a tilted superellipse in 2D.
%
%  Discussion:
%
%    The points are "equally spaced" in the angular sense.  They are
%    not equally spaced along the perimeter.
%
%    The parametric formula of the (untilted) superellipse is:
%
%      X = R1 * cos**EXPO ( THETA )
%      Y = R2 * sin**EXPO ( THETA )
%
%    An implicit form of the (untilted) superellipse is:
%
%      (X/R1)**(2/EXPO) + (Y/R2)**(2/EXPO) = 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Martin Gardner,
%    The Mathematical Carnival,
%    Knopf, 1975, pages 240-254.
% 
%  Parameters:
%
%    Input, real CENTER(2), the center of the superellipse.
%
%    Input, real R1, R2, the "radius" of the superellipse
%    in the major and minor axis directions.  A circle has these values equal.
%
%    Input, real EXPO, the exponent of the superellipse. 
%    0 = a rectangle;
%    between 0 and 1, a "rounded" rectangle;
%    1.0 = an ellipse;
%    2.0 = a diamond;
%    > 2.0 a pinched shape.
%
%    Input, real PSI, the angle that the major axis of the
%    superellipse makes with the X axis.  A value of 0.0 means that the
%    major and minor axes of the superellipse will be the X and Y 
%    coordinate axes.
%
%    Input, integer N, the number of points desired.  N must be at least 1.
%
%    Output, real P(2,N), the coordinates of points 
%    on the superellipse.
%
  for i = 1 : n

    theta = ( 2.0 * pi * ( i - 1 ) ) / n;

    act = abs ( cos ( theta ) );
    sct = r8_sign ( cos ( theta ) );
    ast = abs ( sin ( theta ) );
    sst = r8_sign ( sin ( theta ) );

    p(1,i) = center(1) + r1 * cos ( psi ) * sct * ( act ).^expo ...
                       - r2 * sin ( psi ) * sst * ( ast ).^expo;

    p(2,i) = center(2) + r1 * sin ( psi ) * sct * ( act ).^expo ...
                       + r2 * cos ( psi ) * sst * ( ast ).^expo;

  end

  return
end
