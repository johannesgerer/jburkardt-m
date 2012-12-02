function subset_test15698 ( )

%*****************************************************************************80
%
%% SUBSET_TEST15698 tests VECTOR_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2010
%
%  Author:
%
%    John Burkardt
%
  n_max = 3;

  x_max = [ 2, 6, 4 ]';
  x_min = [ 1, 4, 3 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUBSET_TEST15698\n' );
  fprintf ( 1, '  VECTOR_NEXT:\n' );
  fprintf ( 1, '  Generate all vectors X such that:\n' );
  fprintf ( 1, '    X_MIN(1:N) <= X(1:N) <= X_MAX(1:N),\n' );

  for n = 2 : n_max

    more = 0;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  XMIN  ' );
    for j = 1 : n
      fprintf ( 1, '  %8d', x_min(j) );
    end
    fprintf ( 1, '\n' );

    i = 0;
    x = [];

    while ( 1 )

      [ x, more ] = vector_next ( n, x_min, x_max, x, more );

      if ( ~more )
        break
      end

      i = i + 1;
      fprintf ( 1, '  %4d  ', i );
      for j = 1 : n
        fprintf ( 1, '  %8d', x(j) );
      end
      fprintf ( 1, '\n' );

    end

    fprintf ( 1, '  XMAX  ' );
    for j = 1 : n
      fprintf ( 1, '  %8d', x_max(j) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
