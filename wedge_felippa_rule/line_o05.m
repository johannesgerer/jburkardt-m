function [ w, x ] = line_o05 ( )

%*****************************************************************************80
%
%% LINE_O05 returns a 5 point quadrature rule for the unit line.
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
%    Output, real W(5), the weights.
%
%    Output, real X(5), the abscissas.
%
  w(1:5) = [ ...
    0.118463442528095, ...
    0.239314335249683, ...
    0.284444444444444, ...
    0.239314335249683, ...
    0.118463442528095 ];

  x(1:5) = [ ...
    -0.90617984593866399280, ...
    -0.53846931010568309104, ...
     0.00000000000000000000, ...
     0.53846931010568309104, ...
     0.90617984593866399280 ];

  return
end
