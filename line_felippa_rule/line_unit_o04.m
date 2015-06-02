function [ w, x ] = line_unit_o04 ( )

%*****************************************************************************80
%
%% LINE_UNIT_O04 returns a 4 point quadrature rule for the unit line.
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
%    Output, real W(4), the weights.
%
%    Output, real X(4), the abscissas.
%
  w(1:4,1) = [ ...
    0.34785484513745385737, ...
    0.65214515486254614263, ...
    0.65214515486254614263, ...
    0.34785484513745385737 ] ;

  x(1:4,1) = [ ...
    -0.86113631159405257522, ...
    -0.33998104358485626480, ...
     0.33998104358485626480, ...
     0.86113631159405257522 ];

  return
end
