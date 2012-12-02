function [ a, seed ] = propa_no_random ( prob, k, n, seed )

%*****************************************************************************80
%
%% PROPA_NO_RANDOM returns a random matrix that does not have property A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real PROB, the probability that a link between
%    two eligible nodes will be made.
%
%    Input, integer K, the number of illegal links between nodes 
%    to make.  The routine will TRY to make this many illegal links.  However,
%    it is obviously possible to make K too big.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a(1:n,1:n) = 0.0;
%
%  Assign each index randomly to one of two sets.
%  SET(I) is 0 if I is in set 0, and 1 if it is in set 1.
%
  [ set, seed ] = sub_random ( n, seed );

  for i = 1 : n
    for j = 1 : n
      if ( set(i) ~= set(j) )
        [ chance, seed ] = r8_uniform_01 ( seed );
        if ( chance <= prob )
          a(i,j) = 1.0;
        end
      end
    end
  end
%
%  Now repeatedly pick a pair of indices, and consider setting the
%  corresponding entry of A to 1.
%
  bad = 0;
  tries = 0;

  while ( 1 )

    tries = tries + 1;

    if ( 1000 < tries )
      break
    end

    if ( k <= bad )
      break
    end

    [ i, seed ] = i4_uniform ( 1, n, seed );
    [ j, seed ] = i4_uniform ( 1, n, seed );

    if ( i == j )
      continue
    end

    if ( set(i) ~= set(j) )
      continue
    end

    if ( a(i,j) ~= 0.0 & a(j,i) ~= 0.0 )
      continue
    end

    if ( a(i,j) == 0.0 )
      a(i,j) = 1.0;
    else
      a(j,i) = 1.0;
    end

    bad = bad + 1;

  end

  return
end
