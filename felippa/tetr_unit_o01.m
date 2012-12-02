function [ w, xyz ] = tetr_unit_o01 ( )

%*****************************************************************************80
%
%% TRIG_UNIT_O01 returns a 1 point quadrature rule for the unit tetrahedron.
%
%  Discussion:
%
%    The integration region is:
%
%      0 <= X
%      0 <= Y
%      0 <= Z
%      X + Y + Z <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
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
%    Output, real XYZ(3,1), the abscissas.
%
  w(1:1) = [ ...
    1.0 ];

  xyz(1:3,1:1) = [ ...
    0.25000000000000000000,  0.25000000000000000000,  0.25000000000000000000 ]';

  return
end
