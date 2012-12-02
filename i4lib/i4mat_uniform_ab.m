function [ c, seed ] = i4mat_uniform_ab ( m, n, a, b, seed )

%*****************************************************************************80
%
%% I4MAT_UNIFORM_AB returns a scaled pseudorandom I4MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2006
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
%    Pierre L'Ecuyer,
%    Random Number Generation,
%    in Handbook of Simulation,
%    edited by Jerry Banks,
%    Wiley Interscience, page 95, 1998.
%
%    Bennett Fox,
%    Algorithm 647:
%    Implementation and Relative Efficiency of Quasirandom
%    Sequence Generators,
%    ACM Transactions on Mathematical Software,
%    Volume 12, Number 4, pages 362-376, 1986.
%
%    Peter Lewis, Allen Goodman, James Miller
%    A Pseudo-Random Number Generator for the System/360,
%    IBM Systems Journal,
%    Volume 8, pages 136-143, 1969.
%
%  Parameters:
%
%    Input, integer M, N, the row and column dimensions of the matrix.
%
%    Input, integer A, B, the minimum and maximum acceptable values.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer C(M,N), the randomly chosen integer vector.
%
%    Output, integer SEED, the updated seed.
%
  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_UNIFORM_AB - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'I4MAT_UNIFORM_AB - Fatal error!' );
  end

  seed = floor ( seed );
  a = round ( a );
  b = round ( b );

  for j = 1 : n

    for i = 1 : m

      seed = mod ( seed, 2147483647 );

      if ( seed < 0 ) 
        seed = seed + 2147483647;
      end 

      k = floor ( seed / 127773 );

      seed = 16807 * ( seed - k * 127773 ) - k * 2836;

      if ( seed < 0 )
        seed = seed + 2147483647;
      end

      r = seed * 4.656612875E-10;
%
%  Scale R to lie between A-0.5 and B+0.5.
%
      r = ( 1.0 - r ) * ( min ( a, b ) - 0.5 ) ...
        +         r   * ( max ( a, b ) + 0.5 );
%
%  Use rounding to convert R to an integer between A and B.
%
      value = round ( r );

      value = max ( value, min ( a, b ) );
      value = min ( value, max ( a, b ) );

      c(i,j) = value;

    end
  end

  return
end

