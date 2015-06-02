function [ w, xy ] = triangle_unit_o06 ( )

%*****************************************************************************80
%
%% TRIANGLE_UNIT_O06 returns a 6 point quadrature rule for the unit triangle.
%
%  Discussion:
%
%    This rule is precise for monomials through degree 4.
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
    0.22338158967801146570, ...
    0.22338158967801146570, ...
    0.22338158967801146570, ...
    0.10995174365532186764, ...
    0.10995174365532186764, ...
    0.10995174365532186764 ];

  xy(1:2,1:6) = [ ...
    0.10810301816807022736,  0.44594849091596488632; ...
    0.44594849091596488632,  0.10810301816807022736; ...
    0.44594849091596488632,  0.44594849091596488632; ...
    0.81684757298045851308,  0.091576213509770743460; ...
    0.091576213509770743460,  0.81684757298045851308; ...
    0.091576213509770743460,  0.091576213509770743460 ]';

  return
end
