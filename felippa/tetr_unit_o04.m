function [ w, xyz ] = tetr_unit_o04 ( )

%*****************************************************************************80
%
%% TETR_UNIT_O04 returns a 4 point quadrature rule for the unit tetrahedron.
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
%    Output, real W(4), the weights.
%
%    Output, real XYZ(3,4), the abscissas.
%
  w(1:4) = [ ...
    0.25000000000000000000, ...
    0.25000000000000000000, ...
    0.25000000000000000000, ...
    0.25000000000000000000 ];

  xyz(1:3,1:4) = [ ...
    0.58541019662496845446,  0.13819660112501051518,  0.13819660112501051518; ...
    0.13819660112501051518,  0.58541019662496845446,  0.13819660112501051518; ...
    0.13819660112501051518,  0.13819660112501051518,  0.58541019662496845446; ...
    0.13819660112501051518,  0.13819660112501051518,  0.13819660112501051518 ]';

  return
end
