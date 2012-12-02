function [ x, seed ] = uniform_nsphere_sample ( n, seed )

%*****************************************************************************80
%
%% UNIFORM_NSPHERE_SAMPLE samples the Uniform Unit Sphere PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jerry Banks, editor,
%    Handbook of Simulation,
%    Engineering and Management Press Books, 1998, page 168.
%
%  Parameters:
%
%    Input, integer N, the dimension of the sphere.
%
%    Input, integer ISEED, a seed for the random number generator.
%
%    Output, real X(N), a point on the unit N sphere, chosen
%    with a uniform probability.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  for i = 1 : n
    [ x(i), seed ] = normal_01_sample ( seed );
  end

  x(1:n) = x(1:n) / sqrt ( sum ( x(1:n).^2 ) );

  return
end
