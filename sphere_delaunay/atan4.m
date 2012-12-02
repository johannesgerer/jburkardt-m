function value = atan4 ( y, x )

%*****************************************************************************80
%
%% ATAN4 computes the inverse tangent of the ratio Y / X.
%
%  Discussion:
%
%    ATAN4 returns an angle whose tangent is ( Y / X ), a job which
%    the built in functions ATAN and ATAN2 already do.
%
%    However:
%
%    * ATAN4 always returns a positive angle, between 0 and 2 PI,
%      while ATAN and ATAN2 return angles in the interval [-PI/2,+PI/2]
%      and [-PI,+PI] respectively;
%
%    * ATAN4 accounts for the signs of X and Y, (as does ATAN2).  The ATAN
%     function by contrast always returns an angle in the first or fourth
%     quadrants.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real Y, X, two quantities which represent the tangent of
%    an angle.  If Y is not zero, then the tangent is (Y/X).
%
%    Output, real ATAN4, an angle between 0 and 2 * PI, whose tangent is
%    (Y/X), and which lies in the appropriate quadrant so that the signs
%    of its cosine and sine match those of X and Y.
%

%
%  Special cases:
%
  if ( x == 0.0 )

    if ( 0.0 < y )
      value = pi / 2.0;
    elseif ( y < 0.0 )
      value = 3.0 * pi / 2.0;
    elseif ( y == 0.0 )
      value = 0.0;
    end

  elseif ( y == 0.0 )

    if ( 0.0 < x )
      value = 0.0;
    elseif ( x < 0.0 )
      value = pi;
    end
%
%  We assume that ATAN2 is correct when both arguments are positive.
%
  else

    abs_y = abs ( y );
    abs_x = abs ( x );

    theta_0 = atan2 ( abs_y, abs_x );

    if ( 0.0 < x & 0.0 < y )
      value = theta_0;
    elseif ( x < 0.0 & 0.0 < y )
      value = pi - theta_0;
    elseif ( x < 0.0 & y < 0.0 )
      value = pi + theta_0;
    elseif ( 0.0 < x & y < 0.0 )
      value = 2.0 * pi - theta_0;
    end

  end

  return
end
