function result = tetra_sum ( func, x, y, z, norder, xtab, ytab, ztab, weight )

%*****************************************************************************80
%
%% TETRA_SUM carries out a quadrature rule in a tetrahedron in 3D.
%
%  Integration region:
%
%    A tetrahedron whose vertices are specified.
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
%    John Burkardt
%
%  Parameters:
%
%    Input, external FUNC, name of the function, of the form:
%      function value = func ( x, y, z )
%
%    Input, real X(4), Y(4), Z(4), the coordinates of the vertices.
%
%    Input, integer NORDER, the order of the rule.
%
%    Input, real XTAB(NORDER), YTAB(NORDER), ZTAB(NORDER), the
%    abscissas.
%
%    Input, real WEIGHT(NORDER), the weights.
%
%    Output, real RESULT, the approximate integral of the function.
%
  quad = 0.0;

  for i = 1 : norder

    xval = xtab(i) * x(1) + ytab(i) * x(2) + ztab(i) * x(3) ...
      + ( 1.0 - xtab(i) - ytab(i) - ztab(i) ) * x(4);
    yval = xtab(i) * y(1) + ytab(i) * y(2) + ztab(i) * y(3) ...
      + ( 1.0 - xtab(i) - ytab(i) - ztab(i) ) * y(4);
    zval = xtab(i) * z(1) + ytab(i) * z(2) + ztab(i) * z(3) ...
      + ( 1.0 - xtab(i) - ytab(i) - ztab(i) ) * z(4);

    quad = quad + weight(i) * feval ( func, xval, yval, zval );

  end

  volume = tetra_volume ( x, y, z );
  result = quad * volume;

  return
end
