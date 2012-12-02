function [ w, xyz ] = pyra_unit_o05 ( )

%*****************************************************************************80
%
%% PYRA_UNIT_O05 returns a 5 point quadrature rule for the unit pyramid.
%
%  Discussion:
%
%    The integration region is defined as:
%
%    - ( 1 - Z ) <= X <= 1 - Z
%    - ( 1 - Z ) <= Y <= 1 - Z
%              0 <= Z <= 1.
%
%    When Z is zero, the integration region is a square lying in the (X,Y) 
%    plane, centered at (0,0,0) with "radius" 1.  As Z increases to 1, the 
%    radius of the square diminishes, and when Z reaches 1, the square has 
%    contracted to the single point (0,0,1).
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
%    Output, real W(5), the weights.
%
%    Output, real XYZ(3,5), the abscissas.
%
  w(1:5) = [ ...
   0.21093750000000000000, ...
   0.21093750000000000000, ...
   0.21093750000000000000, ...
   0.21093750000000000000, ...
   0.15625000000000000000 ];

  xyz(1:3,1:5) = [ ...
  -0.48686449556014765641,  -0.48686449556014765641,   0.16666666666666666667; ...
   0.48686449556014765641,  -0.48686449556014765641,   0.16666666666666666667; ...
   0.48686449556014765641,   0.48686449556014765641,   0.16666666666666666667; ...
  -0.48686449556014765641,   0.48686449556014765641,   0.16666666666666666667; ...
   0.00000000000000000000,   0.00000000000000000000,   0.70000000000000000000 ]';


  return
end
