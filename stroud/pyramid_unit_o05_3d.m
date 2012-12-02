function result = pyramid_unit_o05_3d ( func )

%*****************************************************************************80
%
%% PYRAMID_UNIT_O05_3D approximates an integral inside the unit pyramid in 3D.
%
%  Discussion:
%
%    A 5 point formula is used.
%
%    The (X,Y,Z) integration region can be represented as:
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
%    01 April 2008
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
%    Input, external FUNC, the name of the user supplied function which
%    evaluates F(X,Y,Z), of the form
%      function value = func ( x, y, z )
%
%    Output, real RESULT, the approximate integral of the function.
%
  order = 5;

  w = [ ...
   0.21093750000000000000, ...
   0.21093750000000000000, ...
   0.21093750000000000000, ...
   0.21093750000000000000, ...
   0.15625000000000000000 ]';
  x = [ ...
  -0.48686449556014765641, ...
   0.48686449556014765641, ...
   0.48686449556014765641, ...
  -0.48686449556014765641, ...
   0.00000000000000000000 ]';
  y = [ ...
  -0.48686449556014765641, ...
  -0.48686449556014765641, ...
   0.48686449556014765641, ...
   0.48686449556014765641, ...
   0.00000000000000000000 ]';
  z = [ ...
   0.16666666666666666667, ...
   0.16666666666666666667, ...
   0.16666666666666666667, ...
   0.16666666666666666667, ...
   0.70000000000000000000 ]';
%
%  Quadrature.
%
  quad = 0.0;
  for i = 1 : order
    quad = quad + w(i) * feval ( func, x(i), y(i), z(i) );
  end
%
%  Volume.
%
  volume = pyramid_unit_volume_3d ( );
%
%  Result.
%
  result = quad * volume;

  return
end
