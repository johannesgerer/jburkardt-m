function [ num_int, p ] = circle_imp_line_par_int_2d ( r, center, x0, y0, f, g )

%*****************************************************************************80
%
%% CIRCLE_IMP_LINE_PAR_INT_2D: ( implicit circle, parametric line ) intersection in 2D.
%
%  Discussion:
%
%    An implicit circle in 2D satisfies the equation:
%
%      ( X - CENTER(1) )**2 + ( Y - CENTER(2) )**2 = R**2
%
%    The parametric form of a line in 2D is:
%
%      X = X0 + F * T
%      Y = Y0 + G * T
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the circle.
%
%    Input, real CENTER(2,1), the center of the circle.
%
%    Input, real F, G, X0, Y0, the parametric parameters of
%    the line.
%
%    Output, integer NUM_INT, the number of intersecting points found.
%    NUM_INT will be 0, 1 or 2.
%
%    Output, real P(2,NUM_INT), the intersecting points.
%
  dim_num = 2;

  root = r * r * ( f * f + g * g ) - ( f * ( center(2,1) - y0 ) ...
    - g * ( center(1,1) - x0 ) ).^2;

  if ( root < 0.0 )

    num_int = 0;

  elseif ( root == 0.0 )

    num_int = 1;

    t = ( f * ( center(1,1) - x0 ) + g * ( center(2,1) - y0 ) ) ...
      / ( f * f + g * g );
    p(1,1) = x0 + f * t;
    p(2,1) = y0 + g * t;

  elseif ( 0.0 < root )

    num_int = 2;

    t = ( ( f * ( center(1,1) - x0 ) + g * ( center(2,1) - y0 ) ) ...
      - sqrt ( root ) ) / ( f * f + g * g );

    p(1,1) = x0 + f * t;
    p(2,1) = y0 + g * t;

    t = ( ( f * ( center(1,1) - x0 ) + g * ( center(2,1) - y0 ) ) ...
      + sqrt ( root ) ) / ( f * f + g * g );

    p(1,2) = x0 + f * t;
    p(2,2) = y0 + g * t;

  end

  return
end
