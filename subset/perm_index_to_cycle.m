function p2 = perm_index_to_cycle ( n, p1 )

%*****************************************************************************80
%
%% PERM_INDEX_TO_CYCLE converts a permutation from standard index to cycle form.
%
%  Example:
%
%    Input:
%
%      N = 9
%      P1 = 2, 3, 9, 6, 7, 8, 5, 4, 1
%
%    Output:
%
%      P2 = -1, 2, 3, 9, -4, 6, 8, -5, 7
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 June 2004
%
%  Author:
%
%    John Burkardt
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
%    Input, integer N, the number of objects being permuted.
%
%    Input, integer P1(N), the permutation, in standard index form.
%
%    Output, integer P2(N), the permutation, in cycle form.
%
  i = 0;
  j = 1;

  while ( j <= n )

    if ( p1(j) < 0 )

      j = j + 1;

    else

      k = j;

      i = i + 1;
      p2(i) = -k;

      while ( p1(k) ~= j )
        i = i + 1;
        p2(i) = p1(k);
        p1(k) = -p1(k);
        k = abs ( p1(k) );
      end

      p1(k) = -p1(k);

    end

  end

  p1(1:n) = abs ( p1(1:n) );

  return
end
