function [ w, xyz ] = pyra_unit_o08 ( )

%*****************************************************************************80
%
%% PYRA_UNIT_O08 returns an 8 point quadrature rule for the unit pyramid.
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
%    13 April 2009
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
%    Output, real W(8), the weights.
%
%    Output, real XYZ(3,8), the abscissas.
%
  w(1:8) = [ ...
   0.075589411559869072938, ...
   0.075589411559869072938, ...
   0.075589411559869072938, ...
   0.075589411559869072938, ...
   0.17441058844013092706, ...
   0.17441058844013092706, ...
   0.17441058844013092706, ...
   0.17441058844013092706 ];

  xyz(1:3,1:8) = [ ...
  -0.26318405556971359557,  -0.26318405556971359557,   0.54415184401122528880; ...
   0.26318405556971359557,  -0.26318405556971359557,   0.54415184401122528880; ...
   0.26318405556971359557,   0.26318405556971359557,   0.54415184401122528880; ...
  -0.26318405556971359557,   0.26318405556971359557,   0.54415184401122528880; ...
  -0.50661630334978742377,  -0.50661630334978742377,   0.12251482265544137787; ...
   0.50661630334978742377,  -0.50661630334978742377,   0.12251482265544137787; ...
   0.50661630334978742377,   0.50661630334978742377,   0.12251482265544137787; ...
  -0.50661630334978742377,   0.50661630334978742377,   0.12251482265544137787 ]';

  return
end
