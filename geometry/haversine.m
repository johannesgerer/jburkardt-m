function value = haversine ( a )

%*****************************************************************************80
%
%% HAVERSINE computes the haversine of an angle.
%
%  Discussion:
%
%    haversine(A) = ( 1 - cos ( A ) ) / 2
%
%    The haversine is useful in spherical trigonometry.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the angle.
%
%    Output, real VALUE, the haversine of the angle.
%
  value = ( 1.0 - cos ( a ) ) / 2.0;

  return
end
