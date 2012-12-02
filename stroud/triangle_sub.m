function result = triangle_sub ( func, xval, yval, nsub, norder, xtab, ytab, ...
  weight )

%*****************************************************************************80
%
%% TRIANGLE_SUB carries out quadrature over subdivisions of a triangular region.
%
%  Integration region:
%
%    Points (X,Y) such that:
%
%      (X,Y) =
%          ALPHA                * ( XVAL(1), YVAL(1) )
%        + BETA                 * ( XVAL(2), YVAL(2) )
%        + ( 1 - ALPHA - BETA ) * ( XVAL(3), YVAL(3) )
%      0 <= ALPHA <= 1 - BETA
%      0 <= BETA <= 1 - ALPHA
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
%    Input, external FUNC, the name of the user supplied function of
%    two variables which is to be integrated, of the form:
%      function value = func ( x, y )
%
%    Input, real XVAL(3), YVAL(3), the coordinates of the triangle vertices.
%
%    Input, integer NSUB, the number of subdivisions of each side of the
%    input triangle to be made.  NSUB = 1 means no subdivisions are made.
%    NSUB = 3 means that each side of the triangle is subdivided into
%    three portions, and that the original triangle is subdivided into
%    NSUB**2 triangles.  NSUB must be at least 1.
%
%    Input, integer NORDER, the order of the rule.
%
%    Input, real XTAB(NORDER), YTAB(NORDER), the abscissas.
%
%    Input, real WEIGHT(NORDER), the weights of the rule.
%
%    Output, real RESULT, the approximate integral of the function.
%

%
%  Initialize RESULT, the approximate integral.
%
  result = 0.0E+00;
%
%  NSUB must be positive.
%
  if ( nsub <= 0 )
    return;
  end
%
%  Initialize QUAD, the quadrature sum.
%
  quad = 0.0E+00;
%
%  The sub-triangles can be grouped into NSUB strips.
%
  for i = 1 : nsub

    temp1 = 0.0;
    temp2 = i / nsub;

    x2 = xval(2) + temp1 * ( xval(3) - xval(2) ) ...
                 + temp2 * ( xval(1) - xval(2) );

    y2 = yval(2) + temp1 * ( yval(3) - yval(2) ) ...
                 + temp2 * ( yval(1) - yval(2) );

    temp1 = 0.0;
    temp2 = ( i - 1 ) / nsub;

    x3 = xval(2) + temp1 * ( xval(3) - xval(2) ) ...
                 + temp2 * ( xval(1) - xval(2) );

    y3 = yval(2) + temp1 * ( yval(3) - yval(2) ) ...
                 + temp2 * ( yval(1) - yval(2) );
%
%  There are 2*I-1 triangles in strip number I.
%  The next triangle in the strip shares two nodes with the previous one.
%  Compute its corners, (X1,Y1), (X2,Y2), (X3,Y3).
%
    for j = 1 : 2*i-1

      x1 = x2;
      y1 = y2;
      x2 = x3;
      y2 = y3;
      temp1 = floor ( ( j + 1 ) / 2 ) / nsub;
      temp2 = floor ( i - 1 - ( j / 2 ) ) / nsub;

      x3 = xval(2) + temp1 * ( xval(3) - xval(2) ) ...
                   + temp2 * ( xval(1) - xval(2) );

      y3 = yval(2) + temp1 * ( yval(3) - yval(2) ) ...
                   + temp2 * ( yval(1) - yval(2) );
%
%  Now integrate over the triangle, mapping the points ( XTAB(K), YTAB(K) )
%  into the triangle.
%
      for k = 1 : norder

        x = x2 + xtab(k) * ( x3 - x2 ) + ytab(k) * ( x1 - x2 );
        y = y2 + xtab(k) * ( y3 - y2 ) + ytab(k) * ( y1 - y2 );
        quad = quad + weight(k) * feval ( func, x, y );

       end

    end

  end

  volume = triangle_volume ( xval, yval ) / ( nsub * nsub );
  result = quad * volume;

  return
end
