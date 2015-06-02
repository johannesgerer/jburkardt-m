function bubblesort_complexity ( )

%*****************************************************************************80
%
%% BUBBLESORT_COMPLEXITY measures the complexity of the bubblesort algorithm.
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
  fprintf ( 1, 'BUBBLESORT_COMPLEXITY\n' );
  fprintf ( 1, '  How does the time requirement increase with vector length\n' );
  fprintf ( 1, '  for the bubblesort algorithm?\n' );
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
      a_heap = r8vec_sort_bubble_a ( n, a );
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

  filename = 'bubblesort_1to200.png';
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
      a_heap = r8vec_sort_bubble_a ( n, a );
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

  filename = 'bubblesort_powersoftwo.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s".\n', filename );
!
!  Terminate.
!
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BUBBLESORT_COMPLEXITY\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
function a = r8vec_sort_bubble_a ( n, a )

%*****************************************************************************80
%
%% R8VEC_SORT_BUBBLE_A ascending sorts an R8VEC using bubble sort.
%
%  Discussion:
%
%    Bubble sort is simple to program, but inefficient.  It should not
%    be used for large arrays.
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
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, real A(N), an unsorted array.
%
%    Output, real A(N), the array has been sorted.
%
  for i = 1 : n-1
    for j = i + 1 : n
      if ( a(j) < a(i) )
        t    = a(i);
        a(i) = a(j);
        a(j) = t;
      end
    end
  end

  return
end
