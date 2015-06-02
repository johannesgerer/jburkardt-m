function dy = not2dy ( x1, y1, x2, y2, x3, y3, x4, y4 )

%*****************************************************************************80
%
%% NOT2DY evaluates a factor for serendipity basis functions.
%
%  Discussion:
%
%    not2(x1,y1,x2,y2,x3,y3,x4,y4) evaluates at the point (x1,y1), the basis 
%    factor that is 0 at (x2,y2) and (x3,y3) and 1 at (x4,y4):
%
%          ( ( x1 - x2 ) * ( y3 - y2 ) - ( x3 - x2 ) * ( y1 - y2 ) )
%        / ( ( x4 - x2 ) * ( y3 - y2 ) - ( x3 - x2 ) * ( y4 - y2 ) )
%
%    not2dy returns the derivatives of this function with respect to Y1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X1, Y2, the evaluation point.
%
%    Input, real X2, Y2, X3,Y3, values that define the factor.
%
%    Output, real DY, the derivative of the basis function factor
%    with respect to Y1.
%
  dy = (   0.0                     - ( x3 - x2 ) *   1.0       ) ...
     / ( ( x4 - x2 ) * ( y3 - y2 ) - ( x3 - x2 ) * ( y4 - y2 ) );

  return
end
