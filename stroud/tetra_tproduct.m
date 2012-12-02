function result = tetra_tproduct ( func, norder, x, y, z )

%*****************************************************************************80
%
%% TETRA_TPRODUCT approximates an integral in a tetrahedron in 3D.
%
%  Integration region:
%
%    Points inside a tetrahedron whose four corners are given.
%
%  Discussion:
%
%    An NORDER**3 point (2*NORDER-1)-th degree triangular product
%    Gauss-Legendre rule is used.
%
%    With NORDER = 8, this routine is equivalent to the routine TETR15
%    in the reference, page 367.
%
%    Thanks to Joerg Behrens, jbehren@gwdg.de, for numerous suggestions
%    and corrections.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 May 2004
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
%    Input, external FUNC, the name of the user supplied
%    function of three variables which is to be integrated,
%    of the form:
%      function value = func ( x, y, z )
%
%    Input, integer NORDER, the order of the basic quadrature rules.
%    NORDER should be between 1 and 9.
%
%    Input, real X(4), Y(4), Z(4), the coordinates of the vertices
%    of the tetrahedron.
%
%    Output, real RESULT, the approximate integral of the function.
%
  if ( norder < 1 | 9 < norder )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TETRA_TPRODUCT - Fatal error!' );
    fprintf ( 1, '  The quadrature rule orders must be between 1 and 9.' );
    fprintf ( 1, '  The input value was NORDER = %d\n', norder );
    error ( 'TETRA_TPRODUCE - Fatal error!' );
  end
%
%  Get the Gauss-Legendre NORDER point rules on [-1,1] for integrating
%    F(X),
%    X * F(X),
%    X * X * F(X).
%
  [ xtab0, weight0 ] = legendre_set ( norder );
  [ xtab1, weight1 ] = legendre_set_x1 ( norder );
  [ xtab2, weight2 ] = legendre_set_x2 ( norder );
%
%  Adjust the rules from [-1,1] to [0,1].
%
  a = -1.0E+00;
  b = +1.0E+00;
  c =  0.0E+00;
  d =  1.0E+00;

  [ xtab0, weight0 ] = rule_adjust ( a, b, c, d, norder, xtab0, weight0 );

  [ xtab1, weight1 ] = rule_adjust ( a, b, c, d, norder, xtab1, weight1 );

  [ xtab2, weight2 ] = rule_adjust ( a, b, c, d, norder, xtab2, weight2 );
%
%  For rules with a weight function that is not 1, the weight vectors
%  require further adjustment.
%
  weight1(1:norder) = weight1(1:norder) / 2.0E+00;
  weight2(1:norder) = weight2(1:norder) / 4.0E+00;
%
%  Carry out the quadrature.
%
  quad = 0.0;

  for k = 1 : norder
    for j = 1 : norder
      for i = 1 : norder

        xval = x(1) + ( ( ( x(4) - x(3) )   * xtab0(i) ...
                        + ( x(3) - x(2) ) ) * xtab1(j) ...
                        + ( x(2) - x(1) ) ) * xtab2(k);

        yval = y(1) + ( ( ( y(4) - y(3) )   * xtab0(i) ...
                        + ( y(3) - y(2) ) ) * xtab1(j) ...
                        + ( y(2) - y(1) ) ) * xtab2(k);

        zval = z(1) + ( ( ( z(4) - z(3) )   * xtab0(i) ...
                        + ( z(3) - z(2) ) ) * xtab1(j) ...
                        + ( z(2) - z(1) ) ) * xtab2(k);

        quad = quad + 6.0E+00 * weight0(i) * weight1(j) * weight2(k) ...
          * feval ( func, xval, yval, zval );

      end

    end

  end
%
%  Compute the volume of the tetrahedron.
%
  volume = tetra_volume ( x, y, z );
  result = quad * volume;

  return
end
