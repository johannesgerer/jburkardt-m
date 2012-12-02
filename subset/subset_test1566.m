function subset_test1566 ( )

%*****************************************************************************80
%
%% TEST1566 tests VECTOR_CONSTRAINED_NEXT2
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1566\n' );
  fprintf ( 1, '  VECTOR_CONSTRAINED_NEXT2:\n' );
  fprintf ( 1, '  Consider vectors:\n' );
  fprintf ( 1, '    X_MIN(1:N) <= X(1:N) <= X_MAX(1:N),\n' );
  fprintf ( 1, '  Set\n' );
  fprintf ( 1, '    P = Product X_MAX(1:N)\n' );
  fprintf ( 1, '  Accept only vectors for which:\n' );
  fprintf ( 1, '    sum ( X(1:N) * P / X_MAX(1:N) ) <= P\n' );

  x_min = [ 1, 1, 1 ];
  x_max = [ 5, 6, 4 ];

  for n = 2 : n_max

    more = 0;

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

    i = 0;
    x_prod = prod ( x_max(1:n) );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Maximum allowed CONSTRAINT = P =        %d\n', x_prod );
    fprintf ( 1, '\n' );

    x = [];

    while ( 1 )

      [ x, constraint, more ] = vector_constrained_next2 ( ...
        n, x_min, x_max, x, more );

      if ( ~more )
        break
      end

      i = i + 1;
      fprintf ( 1, '  %8d', i );
      for j = 1 : n
        fprintf ( 1, '  %8d', x(j) );
      end
      fprintf ( 1, '  %12d\n', constraint );

    end

  end

  return
end
