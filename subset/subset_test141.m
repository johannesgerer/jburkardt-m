function subset_test141 ( )

%*****************************************************************************80
%
%% TEST141 tests SORT_HEAP_EXTERNAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST141\n' );
  fprintf ( 1, '  SORT_HEAP_EXTERNAL sorts objects externally.\n' );
  fprintf ( 1, '\n' );

  indx = 0;
  isgn = 0;
  seed = 123456789;

  [ a, seed ] = i4vec_uniform ( n, 1, n, seed );

  i4vec_print ( n, a, '  Unsorted array:' );

  while ( 1 )

    [ indx, i, j ] = sort_heap_external ( n, indx, isgn );

    if ( indx < 0 )
      isgn = 1;
      if ( a(i) <= a(j) )
        isgn = -1;
      end 
    elseif ( 0 < indx )
      t = a(i);
      a(i) = a(j);
      a(j) = t;
    else
      break;
    end

  end

  i4vec_print ( n, a, '  Sorted array:' );

  return
end
