function [ zvec, seed ] = c8vec_uniform_01 ( n, seed )

%*****************************************************************************80
%
%% C8VEC_UNIFORM_01 returns a unit pseudorandom C8VEC.
%
%  Discussion:
%
%    The angles should be uniformly distributed between 0 and 2 * PI,
%    the square roots of the radius uniformly distributed between 0 and 1.
%
%    This results in a uniform distribution of values in the unit circle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of values to compute.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, double complex ZVEC(N), the pseudorandom complex vector.
%
%    Output, integer SEED, a seed for the random number generator.
%
  for j = 1 : n

    k = floor ( seed / 127773 );

    seed = 16807 * ( seed - k * 127773 ) - k * 2836;

    if ( seed < 0 )
      seed = seed + 2147483647;
    end

    r = sqrt ( seed * 4.656612875E-10 );

    k = floor ( seed / 127773 );

    seed = 16807 * ( seed - k * 127773 ) - k * 2836;

    if ( seed < 0 )
      seed = seed + 2147483647;
    end

    theta = 2.0 * pi * seed * 4.656612875E-10;

    zvec(j) = r * ( cos ( theta ) + sin ( theta ) * i );

  end

  return
end
