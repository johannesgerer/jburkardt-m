function p2 = perm_cycle_to_canon ( n, p1 )

%*****************************************************************************80
%
%% PERM_CYCLE_TO_CANON converts a permutation from cycle to canonical form.
%
%  Example:
%
%    Input:
%
%      -6 3 1 -5, 4 -2,
%      indicating the cycle structure
%      ( 6, 3, 1 ) ( 5, 4 ) ( 2 )
%
%    Output:
%
%      4 5 2 1 6 3
%
%  Discussion:
%
%    The procedure is to "rotate" the elements of each cycle so that
%    the smallest element is first:
%
%      ( 1, 6, 3 ) ( 4, 5 ) ( 2 )
%
%    and then to sort the cycles in decreasing order of their first
%    (and lowest) element:
%
%      ( 4, 5 ) ( 2 ) ( 1, 6, 3 )
%
%    and then to drop the parentheses:
%
%      4 5 2 1 6 3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Donald Knuth,
%    The Art of Computer Programming,
%    Volume 1, Fundamental Algorithms,
%    Addison Wesley, 1968, pages 176.
%
%  Parameters:
%
%    Input, integer N, the number of objects permuted.
%
%    Input, integer P1(N), the permutation, in cycle form.
%
%    Output, integer P2(N), the permutation, in canonical form.
%
  p2(1:n) = p1(1:n);
%
%  Work on the next cycle.
%
  nlo = 1;
  ncycle = 0;

  while ( nlo <= n )
%
%  Identify NHI, the last index in this cycle.
%
    ncycle = ncycle + 1;

    nhi = nlo;

    while ( nhi < n )
      if ( p2(nhi+1) < 0 )
        break
      end
      nhi = nhi + 1;
    end
%
%  Identify the smallest value in this cycle.
%
    p2(nlo) = -p2(nlo);
    pmin(ncycle) = p2(nlo);
    nmin = nlo;

    for i = nlo+1 : nhi
      if ( p2(i) < pmin(ncycle) )
        pmin(ncycle) = p2(i);
        nmin = i;
      end
    end
%
%  Rotate the cycle so A_MIN occurs first.
%
    ptemp(nlo+nhi+1-nmin:nhi) = p2(nlo:nmin-1);
    ptemp(nlo:nlo+nhi-nmin) = p2(nmin:nhi);

    lo(ncycle) = nlo;
    hi(ncycle) = nhi;
%
%  Prepare to operate on the next cycle.
%
    nlo = nhi + 1;

  end
%
%  Compute a sorting index for the cycle minima.
%
  indx = i4vec_sort_heap_index_d ( ncycle, pmin );
%
%  Copy the cycles out of the temporary array in sorted order.
%
  j = 0;
  for i = 1 : ncycle
    next = indx(i);
    nlo = lo(next);
    nhi = hi(next);
    for k = nlo : nhi
      j = j + 1;
      p2(j) = ptemp(k);
    end
  end

  return
end
