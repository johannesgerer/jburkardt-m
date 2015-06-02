function [ zmat, seed ] = c4mat_uniform_01 ( m, n, seed )

%*****************************************************************************80
%
%% C4MAT_UNIFORM_01 returns a unit pseudorandom C4MAT.
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
%    Input, integer M, N, the number of rows and columns in the matrix.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, complex ZMAT(M,N), the pseudorandom complex matrix.
%
%    Output, integer SEED, a seed for the random number generator.
%
  for i2 = 1 : n
    for i1 = 1 : m

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

      zmat(i1,i2) = r * ( cos ( theta ) + i * sin ( theta ) );

    end

  end

  return
end
