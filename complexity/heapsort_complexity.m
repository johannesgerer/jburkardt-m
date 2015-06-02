function heapsort_complexity ( )

%*****************************************************************************80
%
%% HEAPSORT_COMPLEXITY examines the time required to perform a heap sort.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 December 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HEAPSORT_COMPLEXITY\n' );
  fprintf ( 1, '  How does the time for heapsort increase with vector length N?\n' );
%
%  Get some data for N = 1 : 200.
%  Do the loop twice to avoid startup anomalies.
%
  for i = 1 : 2

    data_size = zeros ( 200, 1 );
    data_time = zeros ( 200, 1 );

    for n = 1 : 200
      a = rand ( n, 1 );
      tic;
      a_heap = r8vec_sort_heap_a ( n, a );
      data_size(n) = n;
      data_time(n) = toc;
    end

  end

  figure ( 1 )
  plot ( data_size, data_time, 'r-' )
  grid on
  xlabel ( 'Vector length N' );
  ylabel ( 'Elapsed time T' );
  title ( 'T(N), time to heap sort a vector of length N' );

  filename = 'heapsort_1to200.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s".\n', filename );
%
%  Get some data for N = 1, 2, 4, ..., 2^12.
%  Do the loop twice to avoid startup anomalies.
%
  for i = 1 : 2

    data_size = zeros ( 13, 1 );
    data_time = zeros ( 13, 1 );

    n = 1;

    for nlog = 0 : 12
      a = rand ( n, 1 );
      tic;
      a_heap = r8vec_sort_heap_a ( n, a );
      data_size(nlog+1) = n;
      data_time(nlog+1) = toc;
      n = n * 2;
    end

  end

  figure ( 2 )
  loglog ( data_size, data_time, 'r-o' )
  grid on
  xlabel ( 'Vector length N' );
  ylabel ( 'Elapsed time T' );
  title ( 'T(N), time to heap sort a vector of length N' );

  filename = 'heapsort_powersoftwo.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s".\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HEAPSORT_COMPLEXITY:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
function a_out = r8vec_heap_d ( n, a )

%*****************************************************************************80
%
%% R8VEC_HEAP_D reorders an R8VEC into an descending heap.
%
%  Discussion:
%
%    A descending heap is an array A with the property that, for every index J,
%    A(J) >= A(2*J) and A(J) >= A(2*J+1), (as long as the indices
%    2*J and 2*J+1 are legal).
%
%  Diagram:
%
%                  A(1)
%                /      \
%            A(2)         A(3)
%          /     \        /  \
%      A(4)       A(5)  A(6) A(7)
%      /  \       /   \
%    A(8) A(9) A(10) A(11)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2004
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
%    Input, integer N, the size of the input array.
%
%    Input, real A(N), an unsorted array.
%
%    Output, real A_OUT(N), the array has been reordered into a heap.
%
  a_out(1:n) = a(1:n);
%
%  Only nodes N/2 down to 1 can be "parent" nodes.
%
  for i = floor ( n/2 ) : -1 : 1
%
%  Copy the value out of the parent node.
%  Position IFREE is now "open".
%
    key = a_out(i);
    ifree = i;

    while ( 1 )
%
%  Positions 2*IFREE and 2*IFREE + 1 are the descendants of position
%  IFREE.  (One or both may not exist because they exceed N.)
%
      m = 2 * ifree;
%
%  Does the first position exist?
%
      if ( n < m )
        break;
      end
%
%  Does the second position exist?
%
      if ( m + 1 <= n )
%
%  If both positions exist, take the larger of the two values,
%  and update M if necessary.
%
        if ( a_out(m) < a_out(m+1) )
          m = m + 1;
        end

      end
%
%  If the large descendant is larger than KEY, move it up,
%  and update IFREE, the location of the free position, and
%  consider the descendants of THIS position.
%
      if ( a_out(m) <= key )
        break;
      end

      a_out(ifree) = a_out(m);
      ifree = m;

    end
%
%  Once there is no more shifting to do, KEY moves into the free spot IFREE.
%
    a_out(ifree) = key;

  end

  return
end
function a_sorted = r8vec_sort_heap_a ( n, a )

%*****************************************************************************80
%
%% R8VEC_SORT_HEAP_A ascending sorts an R8VEC using heap sort.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 April 2004
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
%    Input, integer N, the number of entries in the array.
%
%    Input, real A(N), the array to be sorted;
%
%    Output, real A_SORTED(N), the sorted array.
%
  if ( n < 1 )
    a_sorted = [];
    return
  end

  if ( n == 1 )
    a_sorted(1) = a(1);
    return
  end
%
%  1: Put A into descending heap form.
%
  a_sorted = r8vec_heap_d ( n, a );
%
%  2: Sort A.
%
%  The largest object in the heap is in A(1).
%  Move it to position A(N).
%
  temp = a_sorted(1);
  a_sorted(1) = a_sorted(n);
  a_sorted(n) = temp;
%
%  Consider the diminished heap of size N1.
%
  for n1 = n-1 : -1 : 2
%
%  Restore the heap structure of A(1) through A(N1).
%
    a_sorted(1:n1) = r8vec_heap_d ( n1, a_sorted );
%
%  Take the largest object from A(1) and move it to A(N1).
%
    temp = a_sorted(1);
    a_sorted(1) = a_sorted(n1);
    a_sorted(n1) = temp;

  end

  return
end
