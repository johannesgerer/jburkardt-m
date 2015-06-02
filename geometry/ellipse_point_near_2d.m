function pn = ellipse_point_near_2d ( a, b, p )

%*****************************************************************************80
%
%% ELLIPSE_POINT_NEAR_2D finds the nearest point on an ellipse in 2D.
%
%  Discussion:
%
%    The ellipse is required to have the canonical form:
%
%      (X/A)^2 + (Y/B)^2 = 1
%
%    The nearest point PN on the ellipse has the property that the
%    line from PN to P is normal to the ellipse.  Points on the ellipse
%    can be parameterized by T, to have the form
%
%      ( A * cos ( T ), B * sin ( T ) ).
%
%    The tangent vector to the ellipse has the form
%
%      ( - A * sin ( T ), B * cos ( T ) ) 
%
%    At PN, the dot product of this vector with  ( P - PN ) must be
%    zero:
%
%      - A * sin ( T ) * ( X - A * cos ( T ) )
%      + B * cos ( T ) * ( Y - B * sin ( T ) ) = 0
%
%    This nonlinear equation for T can be solved by Newton's method.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the ellipse parameters.  Normally,
%    these are both positive quantities.  Generally, they are also
%    distinct.
%
%    Input, real P(2), the point.
%
%    Output, real PN(2), the point on the ellipse which
%    is closest to P.
%
  dim_num = 2;
  iteration_max = 100;

  x = abs ( p(1) );
  y = abs ( p(2) );

  if ( y == 0.0 & a * a - b * b <= a * x )

    t = 0.0;

  elseif ( x == 0.0 & b * b - a * a <= b * y )

    t = pi / 2.0;

  else

    if ( y == 0.0 )
      y = sqrt ( eps ) * abs ( b );
    end

    if ( x == 0.0 )
      x = sqrt ( eps ) * abs ( a );
    end
%
%  Initial parameter T:
%
    t = atan2 ( y, x );

    iteration = 0;

    while ( 1 )

      ct = cos ( t );
      st = sin ( t );

      f = ( x - abs ( a ) * ct ) * abs ( a ) * st ...
        - ( y - abs ( b ) * st ) * abs ( b ) * ct;

      if ( abs ( f ) <= 100.0 * eps )
        break
      end

      if ( iteration_max <= iteration )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'ELLIPSE_POINT_NEAR_2D - Warning!\n' );
        fprintf ( 1, '  Reached iteration limit.\n' );
        fprintf ( 1, '  T = %f\n', t );
        fprintf ( 1, '  F = %f\n', f );
        break
      end

      iteration = iteration + 1;

      fp = a * a * st * st + b * b * ct * ct ...
         + ( x - abs ( a ) * ct ) * abs ( a ) * ct ...
         + ( y - abs ( b ) * st ) * abs ( b ) * st;

      t = t - f / fp;

    end

  end
%
%  From the T value, we get the nearest point.
%
  pn(1) = abs ( a ) * cos ( t );
  pn(2) = abs ( b ) * sin ( t );
%
%  Take care of case where the point was in another quadrant.
%
  pn(1) = r8_sign ( p(1) ) * pn(1);
  pn(2) = r8_sign ( p(2) ) * pn(2);

  return
end
