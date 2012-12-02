function result = cube_unit_3d ( func )

%*****************************************************************************80
%
%% CUBE_UNIT_3D approximates an integral inside the unit cube in 3D.
%
%  Integration region:
%
%    Points (X,Y,Z) such that:
%
%      -1 <= X <= 1,
%      -1 <= Y <= 1,
%      -1 <= Z <= 1.
%
%  Discussion:
%
%    An 8 point third degree formula is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur H Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971.
%
%  Parameters:
%
%    Input, external FUNC, the name of the user supplied
%    function which evaluates F(X,Y,Z), of the form
%      function value = func ( x, y, z )
%
%    Output, real RESULT, the approximate integral of the function.
%
  s = 1.0E+00 / sqrt ( 3.0E+00 );
  w = 1.0E+00 / 8.0E+00;

  x = s;
  y = s;
  z = s;

  quad = w * ( ...
      feval ( func,  x,  y,  z ) ...
    + feval ( func,  x,  y, -z ) ...
    + feval ( func,  x, -y,  z ) ...
    + feval ( func,  x, -y, -z ) ...
    + feval ( func, -x,  y,  z ) ...
    + feval ( func, -x,  y, -z ) ...
    + feval ( func, -x, -y,  z ) ...
    + feval ( func, -x, -y, -z ) );

  volume = cube_unit_volume_nd ( 3 );
  result = quad * volume;

  return
end
