function [ a, seed ] = r8vec_uniform ( n, b, c, seed )

%*****************************************************************************80
%
%% R8VEC_UNIFORM returns a scaled pseudorandom R8VEC.
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
%    Input, integer N, the number of entries in the vector.
%
%    Input, real B, C, the range of the pseudorandom values.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(N), the vector of pseudorandom values.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  i4_huge = 2147483647;

  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_UNIFORM - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'R8VEC_UNIFORM - Fatal error!' );
  end

  for i = 1 : n

    k = floor ( seed / 127773 );

    seed = 16807 * ( seed - k * 127773 ) - k * 2836;

    if ( seed < 0 )
      seed = seed + i4_huge;
    end

    a(i) = b + ( c - b ) * seed * 4.656612875E-10;

  end

  return
end
