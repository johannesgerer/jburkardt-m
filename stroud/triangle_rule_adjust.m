function [ xtab_new, ytab_new, weight_new ] = ...
  triangle_rule_adjust ( xval, yval, norder, xtab, ytab, weight )

%*****************************************************************************80
%
%% TRIANGLE_RULE_ADJUST adjusts a unit quadrature rule to an arbitrary triangle.
%
%  Integration region:
%
%    Points (X,Y) such that:
%
%      (X,Y) = ALPHA * (X1,Y1) + BETA * (X2,Y2) + ( 1 - ALPHA - BETA ) * (X3,Y3)
%      0 <= ALPHA <= 1 - BETA
%      0 <= BETA <= 1 - ALPHA
%
%  Discussion:
%
%    This routine accepts as input abscissas and weights appropriate for
%    quadrature in a unit triangle, and returns abscissas and weights
%    appropriate for quadrature in a given triangle.
%
%    Once this routine has been called, an integral over the given triangle
%    can be approximated as:
%
%      QUAD = Sum ( 1 <= I <= NORDER ) WTAB2(I) * FUNC ( XTAB2(I), YTAB2(I) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real XVAL(3), YVAL(3), the coordinates of the nodes.
%
%    Input, integer NORDER, the order of the rule.
%
%    Input, real XTAB(NORDER), YTAB(NORDER), the abscissas for
%    a unit triangle.
%
%    Input, real WEIGHT(NORDER), the weights for a unit triangle.
%
%    Output, real XTAB_NEW(NORDER), YTAB_NEW(NORDER), the adjusted
%    abscissas.
%
%    Output, real WEIGHT_NEW(NORDER), the adjusted weights.
%
  volume = triangle_volume ( xval, yval );

  xtab_new(1:norder) = ...
                  xtab(1:norder)                    * xval(1) ...
                                 + ytab(1:norder)   * xval(2) ...
    + ( 1.0E+00 - xtab(1:norder) - ytab(1:norder) ) * xval(3);

  ytab_new(1:norder) = ...
                  xtab(1:norder)                    * yval(1) ...
                                 + ytab(1:norder)   * yval(2) ...
    + ( 1.0E+00 - xtab(1:norder) - ytab(1:norder) ) * yval(3);

  weight_new(1:norder) = weight(1:norder) * 2.0E+00 * volume;

  return
end
