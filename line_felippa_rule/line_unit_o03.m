function [ w, x ] = line_unit_o03 ( )

%*****************************************************************************80
%
%% LINE_UNIT_O03 returns a 3 point quadrature rule for the unit line.
%
%  Discussion:
%
%    The integration region is:
%
%    - 1.0 <= X <= 1.0
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
%    Output, real W(3), the weights.
%
%    Output, real X(3), the abscissas.
%
  w(1:3,1) = [ ...
    0.55555555555555555556, ...
    0.88888888888888888889, ...
    0.55555555555555555556 ];

  x(1:3,1) = [ ...
    -0.77459666924148337704, ...
     0.00000000000000000000, ...
     0.77459666924148337704 ];

  return
end
