function [ p, seed ] = perm_random3 ( n, seed )

%*****************************************************************************80
%
%% PERM_RANDOM3 selects a random permutation of N elements.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    14 June 2004
%
%  Author:
%
%    Original FORTRAN77 version by James Filliben.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    K L Hoffman and D R Shier,
%    Algorithm 564,
%    A Test Problem Generator for Discrete Linear L1 Approximation Problems,
%    ACM Transactions on Mathematical Software,
%    Volume 6, Number 4, December 1980, pages 615-617.
%
%  Parameters:
%
%    Input, integer N, the number of elements of the array.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer P(N), a permutation, in standard index form.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PERM_RANDOM3 - Fatal error!\n' );
    fprintf ( 1, '  Illegal input value of N  = %d\n', n );
    fprintf ( 1, '  N must be at least 1!\n' );
    error ( 'PERM_RANDOM3 - Fatal error!' );
  end

  if ( n == 1 )
    p(1) = 1;
    return
  end

  p = i4vec_indicator ( n );

  for i = 1 : n

    [ iadd, seed ] = i4_uniform ( 1, n, seed );

    j = i + iadd;

    if ( n < j )
      j = j - n;
    end

    if ( i ~= j )
      [ p(j), p(i) ] = i4_swap ( p(j), p(i) );
    end

  end

  return
end
