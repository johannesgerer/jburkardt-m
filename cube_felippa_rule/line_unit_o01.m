function [ w, x ] = line_unit_o01 ( )

%*****************************************************************************80
%
%% LINE_UNIT_O01 returns a 1 point quadrature rule for the unit line.
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
%    Output, real W(1), the weights.
%
%    Output, real X(1), the abscissas.
%
  w(1) = [ 2.0 ];

  x(1) = [ 0.0 ];

  return
end
