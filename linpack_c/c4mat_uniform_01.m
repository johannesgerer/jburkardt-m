function [ cmat, seed ] = c4mat_uniform_01 ( m, n, seed )

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
%    21 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Paul Bratley, Bennett Fox, Linus Schrage,
%    A Guide to Simulation,
%    Second Edition,
%    Springer, 1987,
%    ISBN: 0387964673,
%    LC: QA76.9.C65.B73.
%
%    Bennett Fox,
%    Algorithm 647:
%    Implementation and Relative Efficiency of Quasirandom
%    Sequence Generators,
%    ACM Transactions on Mathematical Software,
%    Volume 12, Number 4, December 1986, pages 362-376.
%
%    Pierre L'Ecuyer,
%    Random Number Generation,
%    in Handbook of Simulation,
%    edited by Jerry Banks,
%    Wiley, 1998,
%    ISBN: 0471134031,
%    LC: T57.62.H37.
%
%    Peter Lewis, Allen Goodman, James Miller,
%    A Pseudo-Random Number Generator for the System/360,
%    IBM Systems Journal,
%    Volume 8, Number 2, 1969, pages 136-143.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in the matrix.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, complex CMAT(M,N), the pseudorandom complex matrix.
%
%    Output, integer SEED, a seed for the random number generator.
%
  i4_huge = 2147483647;

  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'C4MAT_UNIFORM_01 - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'C4MAT_UNIFORM_01 - Fatal error!' );
  end

  for i2 = 1 : n
    for i1 = 1 : m

      k = floor ( seed / 127773 );

      seed = 16807 * ( seed - k * 127773 ) - k * 2836;

      if ( seed < 0 )
        seed = seed + i4_huge;
      end

      r = sqrt ( seed * 4.656612875E-10 );

      k = floor ( seed / 127773 );

      seed = 16807 * ( seed - k * 127773 ) - k * 2836;

      if ( seed < 0 )
        seed = seed + i4_huge;
      end

      theta = 2.0 * pi * seed * 4.656612875E-10;

      cmat(i1,i2) = r * ( cos ( theta ) + i * sin ( theta ) );

    end

  end

  return
end
