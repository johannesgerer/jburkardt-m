function [ x, seed ] = uniform_on_hemisphere01_phong ( n, m, seed )

%*****************************************************************************80
%
%% UNIFORM_ON_HEMISPHERE01_PHONG maps uniform points onto the unit hemisphere.
%
%  Discussion:
%
%    The sphere has center 0 and radius 1.
%
%    The Phong density is used, with exponent M:
%
%    rho ( theta, phi; m ) = ( m + 1 ) * cos ( phi )**M / ( 2 * pi )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 April 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Peter Shirley,
%    Nonuniform Random Point Sets Via Warping,
%    Graphics Gems, Volume III,
%    edited by David Kirk,
%    AP Professional, 1992, 
%    ISBN: 0122861663,
%    LC: T385.G6973.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, integer M, the Phong exponent.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(3,N), the points.
%
  dim_num = 3;

  power = 1.0 / ( m + 1 );
  [ phi, seed ] = r8vec_uniform_01 ( n, seed );
  phi(1:n) = acos ( ( 1.0 - phi(1:n) ).^power );

  [ theta, seed ] = r8vec_uniform_01 ( n, seed );
  theta(1:n) = 2.0 * pi * theta(1:n);

  x(1,1:n) = cos ( theta ) .* sin ( phi );
  x(2,1:n) = sin ( theta ) .* sin ( phi );
  x(3,1:n) = cos ( phi );

  return
end
