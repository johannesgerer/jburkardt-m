function [ w, x ] = line_o02 ( )

%*****************************************************************************80
%
%% LINE_O02 returns a 2 point quadrature rule for the unit line.
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
%    Output, real W(2), the weights.
%
%    Output, real X(2), the abscissas.
%
  w(1:2) = [ ...
    0.5, ...
    0.5 ];

  x(1:2) = [ ...
    -0.57735026918962576451, ...
     0.57735026918962576451 ];

  return
end
