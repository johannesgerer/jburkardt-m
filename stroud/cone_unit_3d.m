function result = cone_unit_3d ( func )

%*****************************************************************************80
%
%% CONE_UNIT_3D approximates an integral inside a unit cone in 3D.
%
%  Integration Region:
%
%    X**2 + Y**2 <= 1 - Z
%    0 <= Z <= 1.
%
%  Discussion:
%
%    An 48 point degree 7 formula, Stroud CN:S2:7-1, is used.
%
%    (There is a typographical error in the S2:7-1 formula for B3.)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971, page 339.
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied function which
%    evaluates F(X,Y,Z), of the form
%      function value = func ( x, y, z )
%
%    Output, real RESULT, the approximate integral of the function.
%
  u = [ 0.04850054945E+00, 0.2386007376E+00, 0.5170472951E+00,  0.7958514179E+00 ];
  w1 = [ 0.1108884156E+00,  0.1434587878E+00, 0.06863388717E+00, 0.01035224075E+00 ];

  a = sqrt ( 3.0E+00 ) / 2.0E+00;
  b = sqrt ( ( 27.0E+00 - 3.0E+00 * sqrt ( 29.0E+00 ) ) / 104.0E+00 );
  c = sqrt ( ( 27.0E+00 + 3.0E+00 * sqrt ( 29.0E+00 ) ) / 104.0E+00 );
  w2(1:3) = 3.0E+00 * [ ...
    2.0E+00 / 27.0E+00, ...
    ( 551.0E+00 + 4.0E+00 * sqrt ( 29.0E+00 ) ) / 6264.0E+00, ...
    ( 551.0E+00 - 4.0E+00 * sqrt ( 29.0E+00 ) ) / 6264.0E+00 ];

  quad = 0.0E+00;

  for i = 1 : 4

    x = a * ( 1.0E+00 - u(i) );
    y = 0.0E+00;
    z = u(i);
    quad = quad + w1(i) * w2(1) * feval ( func, x, y, z );

    x = - a * ( 1.0E+00 - u(i) );
    y = 0.0E+00;
    z = u(i);
    quad = quad + w1(i) * w2(1) * feval ( func, x, y, z );

    x = 0.0E+00;
    y = a * ( 1.0E+00 - u(i) );
    z = u(i);
    quad = quad + w1(i) * w2(1) * feval ( func, x, y, z );

    x = 0.0E+00;
    y = - a * ( 1.0E+00 - u(i) );
    z = u(i);
    quad = quad + w1(i) * w2(1) * feval ( func, x, y, z );

  end

  for i = 1 : 4

    x =   b * ( 1.0E+00 - u(i) );
    y =   b * ( 1.0E+00 - u(i) );
    z =   u(i);
    quad = quad + w1(i) * w2(2) * feval ( func, x, y, z );

    x = - b * ( 1.0E+00 - u(i) );
    y =   b * ( 1.0E+00 - u(i) );
    z =   u(i);
    quad = quad + w1(i) * w2(2) * feval ( func, x, y, z );

    x = - b * ( 1.0E+00 - u(i) );
    y = - b * ( 1.0E+00 - u(i) );
    z =   u(i);
    quad = quad + w1(i) * w2(2) * feval ( func, x, y, z );

    x =   b * ( 1.0E+00 - u(i) );
    y = - b * ( 1.0E+00 - u(i) );
    z =   u(i);
    quad = quad + w1(i) * w2(2) * feval ( func, x, y, z );

    x =   c * ( 1.0E+00 - u(i) );
    y =   c * ( 1.0E+00 - u(i) );
    z =   u(i);
    quad = quad + w1(i) * w2(3) * feval ( func, x, y, z );

    x = - c * ( 1.0E+00 - u(i) );
    y =   c * ( 1.0E+00 - u(i) );
    z =   u(i);
    quad = quad + w1(i) * w2(3) * feval ( func, x, y, z );

    x = - c * ( 1.0E+00 - u(i) );
    y = - c * ( 1.0E+00 - u(i) );
    z =   u(i);
    quad = quad + w1(i) * w2(3) * feval ( func, x, y, z );

    x =   c * ( 1.0E+00 - u(i) );
    y = - c * ( 1.0E+00 - u(i) );
    z =   u(i);
    quad = quad + w1(i) * w2(3) * feval ( func, x, y, z );

  end

  r = 1.0E+00;
  h = 1.0E+00;

  volume = cone_volume_3d ( r, h );
  result = quad * volume;

  return
end
