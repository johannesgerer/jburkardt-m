function [ l4mat, seed ] = l4mat_uniform ( m, n, seed )

%*****************************************************************************80
%
%% L4MAT_UNIFORM returns a pseudorandom L4MAT.
%
%  Discussion:
%
%    An L4MAT is a two dimensional array of LOGICAL values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 May 2008
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
%    Input, integer M, N, the order of the matrix.
%
%    Input/output, integer SEED, the "seed" value, which should
%    NOT be 0.  On output, SEED has been updated.
%
%    Output, logical L4MAT(M,N), a pseudorandom logical matrix.
%
  l4mat = zeros ( m, n );

  i4_huge      = 2147483647;
  i4_huge_half = 1073741823;

  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'L4MAT_UNIFORM - Fatal error!\n' );
    fprintf ( 1, '  Input value of SEED = 0.\n' );
    error ( 'L4MAT_UNIFORM - Fatal error!' );
  end

  for j = 1 : n

    for i = 1 : m

      k = floor ( seed / 127773 );

      seed = 16807 * ( seed - k * 127773 ) - k * 2836;

      if ( seed < 0 )
        seed = seed + i4_huge;
      end

      l4mat(i,j) = ( i4_huge_half < seed );

    end

  end

  return
end
