function result = circle_rt_sum ( func, xc, yc, radius, nr, ra, rw, nt, ta, ...
  tw, zw )

%*****************************************************************************80
%
%% CIRCLE_RT_SUM applies an R, THETA product quadrature rule inside a circle.
%
%  Integration region:
%
%    Points (X,Y) such that:
%
%      (X-XC)**2 + (Y-YC)**2 <= RADIUS**2.
%
%  Discussion:
%
%    The product rule is assumed to be have the form:
%
%      Integral_Approx = ZW * F(XC,YC) +
%        Sum ( 1 <= IR <= NR ) Sum ( 1 <= IT <= NT )
%        RW(IR) * TW(IT) * F ( XC + R(IR) * RADIUS * Cos ( TA(IT) ),
%                              YC + R(IR) * RADIUS * Sin ( TA(IT) ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied
%    function of two variables which is to be integrated,
%    of the form:
%      function value = func ( x, y )
%
%    Input, real XC, YC, the coordinates of the center of
%    the circle.
%
%    Input, realn RADIUS, the radius of the circle.
%
%    Input, integer NR, the number of R abscissas.
%
%    Input, real RA(NR), RW(NR), the R abscissas and weights.
%
%    Input, integer NT, the number of Theta abscissas.
%
%    Input, real TA(NT), TW(NT), the THETA abscissas and weights.
%
%    Input, real ZW, the weight to use for the center.
%
%    Output, real RESULT, the approximate integral of the function.
%
  quad = 0.0E+00;

  if ( zw ~= 0.0E+00 )
    x = xc;
    y = yc;
    quad = quad + zw * feval ( func, x, y );
  end

  for it = 1 : nt
    rct = radius * cos ( ta(it) );
    rst = radius * sin ( ta(it) );
    for ir = 1 : nr
      x = xc + ra(ir) * rct;
      y = yc + ra(ir) * rst;
      quad = quad + tw(it) * rw(ir) * feval ( func, x, y );
    end
  end

  volume = circle_area_2d ( radius );
  result = quad * volume;

  return
end
