function value = r8_cot ( angle )

%*****************************************************************************80
%
%% R8_COT returns the cotangent of an angle.
%
%  Discussion:
%
%    R8_COT ( THETA ) = COS ( THETA ) / SIN ( THETA )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ANGLE, the angle, in radians.
%
%    Output, real VALUE, the cotangent of the angle.
%
  value  = cos ( angle ) / sin ( angle );

  return
end
