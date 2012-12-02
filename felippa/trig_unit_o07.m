function [ w, xy ] = trig_unit_o07 ( )

%*****************************************************************************80
%
%% TRIG_UNIT_O07 returns a 7 point quadrature rule for the unit triangle.
%
%  Discussion:
%
%    This rule is precise for monomials through degree 5.
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
%    Output, real W(7), the weights.
%
%    Output, real XY(2,7), the abscissas.
%
  w(1:7) = [ ...
    0.12593918054482715260, ...
    0.12593918054482715260, ...
    0.12593918054482715260, ...
    0.13239415278850618074, ...
    0.13239415278850618074, ...
    0.13239415278850618074, ...
    0.22500000000000000000 ];

  xy(1:2,1:7) = [ ...
    0.79742698535308732240,  0.10128650732345633880; ...
    0.10128650732345633880,  0.79742698535308732240; ...
    0.10128650732345633880,  0.10128650732345633880; ...
    0.059715871789769820459,  0.47014206410511508977; ...
    0.47014206410511508977,  0.059715871789769820459; ...
    0.47014206410511508977,  0.47014206410511508977; ...
    0.33333333333333333333,  0.33333333333333333333 ]';

  return
end
