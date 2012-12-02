function [ w, xyz ] = pyra_unit_o09 ( )

%*****************************************************************************80
%
%% PYRA_UNIT_O09 returns a 9 point quadrature rule for the unit pyramid.
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
%    Output, real W(9), the weights.
%
%    Output, real XYZ(3,9), the abscissas.
%
  w(1:9) = [ ...
   0.13073389672275944791, ...
   0.13073389672275944791, ...
   0.13073389672275944791, ...
   0.13073389672275944791, ...
   0.10989110327724055209, ...
   0.10989110327724055209, ...
   0.10989110327724055209, ...
   0.10989110327724055209, ...
   0.03750000000000000000 ];

  xyz(1:3,1:9) = [ ...
  -0.52966422253852215131,  -0.52966422253852215131,   0.08176876558246862335; ...
   0.52966422253852215131,  -0.52966422253852215131,   0.08176876558246862335; ...
   0.52966422253852215131,   0.52966422253852215131,   0.08176876558246862335; ...
  -0.52966422253852215131,   0.52966422253852215131,   0.08176876558246862335; ...
  -0.34819753825720418039,  -0.34819753825720418039,   0.400374091560388519511; ...
   0.34819753825720418039,  -0.34819753825720418039,   0.400374091560388519511; ...
   0.34819753825720418039,   0.34819753825720418039,   0.400374091560388519511; ...
  -0.34819753825720418039,   0.34819753825720418039,   0.400374091560388519511; ...
   0.00000000000000000000,   0.00000000000000000000,   0.83333333333333333333 ]';

  return
end
