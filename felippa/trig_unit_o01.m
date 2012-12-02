function [ w, xy ] = trig_unit_o01 ( )

%*****************************************************************************80
%
%% TRIG_UNIT_O01 returns a 1 point quadrature rule for the unit triangle.
%
%  Discussion:
%
%    This rule is precise for monomials through degree 1.
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
%    Output, real W(1), the weights.
%
%    Output, real XY(2,1), the abscissas.
%
  w(1) = [ ...
    1.0 ];

  xy(1:2,1) = [ ...
    0.33333333333333333333,  0.33333333333333333333 ]';

  return
end
