function [ a, seed ] = ytb_random ( n, lambda, seed )

%*****************************************************************************80
%
%% YTB_RANDOM selects a random Young tableau of a given shape.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 June 2004
%
%  Reference:
%
%    A Nijenhuis and H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the integer which has been partitioned.
%
%    Input, integer LAMBDA(N), the partition of N.
%    N = sum ( 1 <= I <= N ) LAMBDA(I).
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer A(N), the vector describing the Young tableau.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  a(1:n) = 0;

  i = 0;
  k = 0;

  while ( 1 )

    i = i + 1;
    for j = 1 : lambda(i)
      a(j) = a(j) + 1;
      k = k + 1;
    end

    if ( n <= k )
      break;
    end

  end

  for m = 1 : n

    while ( 1 )

      [ i, seed ] = i4_uniform ( 1, a(1), seed );
      [ j, seed ] = i4_uniform ( 1, lambda(1), seed );

      if ( i <= a(j) & j <= lambda(i) )
        break;
      end

    end

    while ( 1 )

      ih = a(j) + lambda(i) - i - j;

      if ( ih == 0 )
        break;
      end

      [ k, seed ] = i4_uniform ( 1, ih, seed );

      if ( k <= lambda(i)-j )
        j = j + k;
      else
        i = k - lambda(i) + i + j;
      end

    end

    lambda(i) = lambda(i) - 1;
    a(j) = a(j) - 1;
    a(n+1-m) = i;

  end

  for i = 1 : n
    lambda(a(i)) = lambda(a(i)) + 1;
  end

  return
end
