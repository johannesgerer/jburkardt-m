function order = hexagon_unit_set ( rule )

%*****************************************************************************80
%
%% HEXAGON_UNIT_SIZE sizes a quadrature rule inside the unit hexagon in 2D.
%
%  Integration region:
%
%    The definition is given in terms of THETA, the angle in degrees of the
%    vector (X,Y).  The following six conditions apply, respectively,
%    between the bracketing values of THETA of 0, 60, 120, 180, 240,
%    300, and 360.
%
%                              0 <= Y <= - SQRT(3) * X + SQRT(3)
%                              0 <= Y <=                 SQRT(3)/2
%                              0 <= Y <=   SQRT(3) * X + SQRT(3)
%      - SQRT(3) * X - SQRT(3)   <= Y <= 0
%                    - SQRT(3)/2 <= Y <= 0
%        SQRT(3) * X - SQRT(3)   <= Y <= 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    18 March 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Abramowitz and Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964.
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971.
%
%  Parameters:
%
%    Input, integer RULE, the rule desired.
%      1, 1 point,  degree 1;
%      2, 4 points, degree 3;
%      3, 7 points, degree 3;
%      4, 7 points, degree 5;
%
%    Output, integer ORDER, the order of the desired rule.
%    If RULE is not legal, then ORDER is returned as -1.
%
  if ( rule == 1 )

    order = 1;
%
%  Stroud rule H2:3-1.
%
  elseif ( rule == 2 )

    order = 4;
%
%  Stroud rule H2:3-2.
%
  elseif ( rule == 3 )

    order = 7;
%
%  Stroud rule H2:5-1.
%
  elseif ( rule == 4 )

    order = 7;

  else

    order = -1;

  end

  return
end
