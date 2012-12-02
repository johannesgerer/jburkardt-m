function result = tetra_07 ( func, x, y, z )

%*****************************************************************************80
%
%% TETRA_07 approximates an integral inside a tetrahedron in 3D.
%
%  Integration region:
%
%    Points inside a tetrahedron whose four corners are given.
%
%  Discussion:
%
%    A 64 point 7-th degree conical product Gauss formula is used,
%    Stroud number T3:7-1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 November 2004
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
%    Stroud and Secrest,
%    Gaussian Quadrature Formulas,
%    Prentice Hall, 1966, pages 42-43.
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied
%    function of three variables which is to be integrated,
%    of the form:
%      function value = func ( x, y, z )
%
%    Input, real X(4), Y(4), Z(4), the X, Y and Z coordinates of
%    the vertices.
%
%    Output, real RESULT, the approximate integral of the function.
%
  norder = 4;
  weight2 = [ ...
    0.1355069134, 0.2034645680, 0.1298475476, 0.0311809709 ];
  weight3 = [ ...
    0.1108884156, 0.1434587898, 0.0686338872, 0.0103522407 ];
  xtab2 = [ ...
    0.0571041961E+00, 0.2768430136E+00, 0.5835904324E+00, 0.8602401357E+00 ];
  xtab3 = [ ...
    0.0485005495E+00, 0.2386007376E+00, 0.5170472951E+00, 0.7958514179E+00 ];
%
%  Get the Gauss-Legendre weights and abscissas for [-1,1].
%
  [ xtab1, weight1 ] = legendre_set ( norder );
%
%  Adjust the rule for the interval [0,1].
%
  a = -1.0E+00;
  b = +1.0E+00;

  c =  0.0E+00;
  d =  1.0E+00;

  [ xtab1, weight1 ] = rule_adjust ( a, b, c, d, norder, xtab1, weight1 );
%
%  Carry out the quadrature.
%
  quad = 0.0;

  for i = 1 : norder
    for j = 1 : norder
      for k = 1 : norder
%
%  Compute the barycentric coordinates of the point in the unit triangle.
%
        t =                                                 xtab3(k);
        u =                        xtab2(j)   * ( 1.0E+00 - xtab3(k) );
        v = xtab1(i) * ( 1.0E+00 - xtab2(j) ) * ( 1.0E+00 - xtab3(k) );
        w = 1.0E+00 - t - u - v;
%
%  Compute the corresponding point in the triangle.
%
        xval = t * x(1) + u * x(2) + v * x(3) + w * x(4);
        yval = t * y(1) + u * y(2) + v * y(3) + w * y(4);
        zval = t * z(1) + u * z(2) + v * z(3) + w * z(4);
        quad = quad + 6.0 * weight1(i) * weight2(j) * weight3(k) ...
          * feval ( func, xval, yval, zval );

      end
    end
  end

  volume = tetra_volume ( x, y, z );
  result = quad * volume;

  return
end
