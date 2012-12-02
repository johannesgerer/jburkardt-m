function p2 = perm_cycle_to_index ( n, p1 )

%*****************************************************************************80
%
%% PERM_CYCLE_TO_INDEX converts a permutation from cycle to standard index form.
%
%  Example:
%
%    Input:
%
%      N = 9
%      P1 = -1, 2, 3, 9, -4, 6, 8, -5, 7
%
%    Output:
%
%      P2 = 2, 3, 9, 6, 7, 8, 5, 4, 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 June 2004
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
%    Input, integer P1(N), the permutation, in cycle form.
%
%    Output, integer P2(N), the permutation, in standard index form.
%
  for j = 1 : n

    k1 = p1(j);

    if ( k1 < 0 )
      k1 = -k1;
      k3 = k1;
    end

    if ( j + 1 <= n )
      k2 = p1(j+1);
      if ( k2 < 0 )
        k2 = k3;
      end
    else
      k2 = k3;
    end

    p2(k1) = k2;

  end

  return
end
