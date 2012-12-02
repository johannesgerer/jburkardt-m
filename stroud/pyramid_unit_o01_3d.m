function result = pyramid_unit_o01_3d ( func )

%*****************************************************************************80
%
%% PYRAMID_UNIT_O01_3D approximates an integral inside the unit pyramid in 3D.
%
%  Discussion:
%
%    A 1 point degree 1 formula is used.
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
%    31 March 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971,
%    ISBN: 0130438936,
%    LC: QA311.S85.
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied function which
%    evaluates F(X,Y,Z).
%
%    Output, real RESULT, the approximate integral of the function.
%

%
%  Quadrature.
%
  quad = 0.0;

  x = 0.0;
  y = 0.0;
  z = 1.0 / 4.0;
  w = 1.0;

  quad = quad + w * feval ( func, x, y, z );
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
