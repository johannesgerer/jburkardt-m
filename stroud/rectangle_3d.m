function result = rectangle_3d ( func, a, b )

%*****************************************************************************80
%
%% RECTANGLE_3D approximates an integral inside a rectangular block in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that:
%
%      A(1) <= X <= B(1),
%      A(2) <= Y <= B(2),
%      A(3) <= Z <= B(3).
%
%  Discussion:
%
%    An 8 point third degree formula is used.
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
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Arthur H Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971.
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied function which
%    evaluates F(X,Y,Z), of the form
%      function valule = func ( x, y, z )
%
%    Input, real A(3), B(3), the lower and upper limits
%    for X, Y and Z.
%
%    Output, real RESULT, the approximate integral of the function.
%
  sqr3 = 1.0E+00 / sqrt ( 3.0E+00 );
  w = 1.0E+00 / 8.0E+00;

  quad = 0.0E+00;

  for i = 1 : 2

    x = sqr3 * ( -1 )^i;
    x = 0.5E+00 * ( ( 1.0E+00 - x ) * b(1) + ( 1.0E+00 + x ) * a(1) );

    for j = 1 : 2

      y = sqr3 * (  -1 )^j;
      y = 0.5E+00 * ( ( 1.0E+00 - y ) * b(2) + ( 1.0E+00 + y ) * a(2) );

      for k = 1 : 2

        z = sqr3 * ( -1 )^k;
        z = 0.5E+00 * ( ( 1.0E+00 - z ) * b(3) + ( 1.0E+00 + z ) * a(3) );

        quad = quad + w * feval ( func, x, y, z );

      end

    end

  end

  volume = ( b(1) - a(1) ) * ( b(2) - a(2) ) * ( b(3) - a(3) );
  result = volume * quad;
