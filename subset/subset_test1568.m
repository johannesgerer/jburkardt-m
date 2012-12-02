function subset_test1568 ( )

%*****************************************************************************80
%
%% TEST1568 tests VECTOR_CONSTRAINED_NEXT4.
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
  n_max = 3;

  alpha = [ 4.0, 3.0, 5.0 ];
  q = 20.0;
  x_max = [ 2, 6, 4 ];
  x_min = [ 1, 0, 1 ];
  x = [];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1568\n' );
  fprintf ( 1, '  VECTOR_CONSTRAINED_NEXT4:\n' );
  fprintf ( 1, '  Consider vectors:\n' );
  fprintf ( 1, '    X_MIN(1:N) <= X(1:N) <= X_MAX(1:N),\n' );
  fprintf ( 1, '  Set\n' );
  fprintf ( 1, '    TOTAL = sum ( ALPHA(1:N) * X(1:N) )\n' );
  fprintf ( 1, '  Accept only vectors for which:\n' );
  fprintf ( 1, '    TOTAL <= Q\n' );

  for n = 2 : n_max

    more = 0;

    fprintf ( 1, '  ALPHA:\n' );
    for i = 1 : n
      fprintf ( 1, '  %14f', alpha(i) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, 'Q:    %14f\n', q );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  X_MIN:' );
    for i = 1 : n
      fprintf ( 1, '  %2d', x_min(i) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  X_MAX:' );
    for i = 1 : n
      fprintf ( 1, '  %2d', x_max(i) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );

    i = 0;

    while ( 1 )

      [ x, more ] = vector_constrained_next4 ( ...
        n, alpha, x_min, x_max, x, q, more );

      if ( ~more )
        break;
      end

      total = alpha(1:n) * x(1:n)';
      i = i + 1;
      fprintf ( 1, '  %8d  %14f', i, total );
      for i = 1 : n
        fprintf ( 1, '  %8d', x(i) );
      end
      fprintf ( 1, '\n' );

    end

  end

  return
end
