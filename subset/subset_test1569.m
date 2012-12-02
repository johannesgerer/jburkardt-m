function subset_test1569 ( )

%*****************************************************************************80
%
%% TEST1569 tests VECTOR_CONSTRAINED_NEXT5
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
  n = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1569\n' );
  fprintf ( 1, '  VECTOR_CONSTRAINED_NEXT5:\n' );
  fprintf ( 1, '  Generate integer vectors X such that:\n' );
  fprintf ( 1, '    SUM_MIN <= sum ( X(1:N) ) <= SUM_MAX,\n' );
  fprintf ( 1, '  We require every X(I) to be at least 1.\n' );

  more = 0;
  sum_min = 5;
  sum_max = 7;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N =       %d\n', n );
  fprintf ( 1, '  SUM_MIN = %d\n', sum_min );
  fprintf ( 1, '  SUM_MAX = %d\n', sum_max );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         #        X(1)      X(2)      X(3)\n' );
  fprintf ( 1, '\n' );

  i = 0;
  x = [];
  
  while ( 1 )

    [ x, more ] = vector_constrained_next5 ( n, x, sum_min, sum_max, more );

    if ( ~more )
      break
    end

    i = i + 1;
    fprintf ( 1, '  %8d', i );
    for j = 1 : n
      fprintf ( 1, '  %8d', x(j) );
    end
    fprintf ( 1, '\n');

  end

  return
end
