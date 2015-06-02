function [ w, xy ] = triangle_unit_o06b ( )

%*****************************************************************************80
%
%% TRIANGLE_UNIT_O06B returns a 6 point quadrature rule for the unit triangle.
%
%  Discussion:
%
%    This rule is precise for monomials through degree 3.
%
%    The integration region is:
%
%      0 <= X
%      0 <= Y
%      X + Y <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Carlos Felippa,
%    A compendium of FEM integration formulas for symbolic work,
%    Engineering Computation,
%    Volume 21, Number 8, 2004, pages 867-890.
%
%  Parameters:
%
%    Output, real W(6), the weights.
%
%    Output, real XY(2,6), the abscissas.
%
  w(1:6,1) = [ ...
    0.30000000000000000000, ...
    0.30000000000000000000, ...
    0.30000000000000000000, ...
    0.033333333333333333333, ...
    0.033333333333333333333, ...
    0.033333333333333333333 ];

  xy(1:2,1:6) = [ ...
    0.66666666666666666667,  0.16666666666666666667; ...
    0.16666666666666666667,  0.66666666666666666667; ...
    0.16666666666666666667,  0.16666666666666666667; ...
    0.0,  0.5; ...
    0.5,  0.0; ...
    0.5,  0.5 ]';

  return
end
