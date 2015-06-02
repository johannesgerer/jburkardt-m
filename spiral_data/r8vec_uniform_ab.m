function [ x, seed ] = r8vec_uniform_ab ( n, a, b, seed )

%*****************************************************************************80
%
%% R8VEC_UNIFORM_AB returns a scaled pseudorandom R8VEC.
%
%  Discussion:
%
%    Each dimension ranges from A to B.
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
%    Springer Verlag, pages 201-202, 1983.
%
%    Bennett Fox,
%    Algorithm 647:
%    Implementation and Relative Efficiency of Quasirandom
%    Sequence Generators,
%    ACM Transactions on Mathematical Software,
%    Volume 12, Number 4, pages 362-376, 1986.
%
%    Peter Lewis, Allen Goodman, James Miller,
%    A Pseudo-Random Number Generator for the System/360,
%    IBM Systems Journal,
%    Volume 8, pages 136-143, 1969.
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, real A, B, the range of the pseudorandom values.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real X(N,1), the vector of pseudorandom values.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  i4_huge = 2147483647;

  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_UNIFORM_AB - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'R8VEC_UNIFORM_AB - Fatal error!' );
  end

  x = zeros ( n, 1 );

  for i = 1 : n

    k = floor ( seed / 127773 );

    seed = 16807 * ( seed - k * 127773 ) - k * 2836;

    if ( seed < 0 )
      seed = seed + i4_huge;
    end

    x(i) = a + ( b - a ) * seed * 4.656612875E-10;

  end

  return
end
