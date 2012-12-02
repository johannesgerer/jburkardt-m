function valule = r83_norm ( x, y, z )

%*****************************************************************************80
%
%% R83_NORM returns the Euclidean norm of an R83.
%
%  Discussion:
%
%    An R83 is a vector of 3 R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, Z, the vector.
%
%    Output, real VALUE, the norm of the vector.
%
  value = sqrt ( x * x + y * y + z * z );

  return
end
