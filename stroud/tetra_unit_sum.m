function result = tetra_unit_sum ( func, norder, xtab, ytab, ztab, weight )

%*****************************************************************************80
%
%% TETRA_UNIT_SUM carries out a quadrature rule in the unit tetrahedron in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that
%
%      0 <= X,
%      0 <= Y,
%      0 <= Z, and
%      X + Y + Z <= 1.
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
%    John Burkardt
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied
%    function of three variables which is to be integrated,
%    of the form:
%      function value = func ( x, y, z )
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
  quad = 0.0E+00;

  for i = 1 : norder
    quad = quad + weight(i) * feval ( func, xtab(i), ytab(i), ztab(i) );
  end

  volume = tetra_unit_volume ( );
  result = quad * volume;

  return
end
