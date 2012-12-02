function blend_test12 ( )

%*****************************************************************************80
%
%% BLEND_TEST12 tests BLEND_113.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2008
%
%  Author:
%
%    John Burkardt
%
  n1 = 3;
  n2 = 5;
  n3 = 4;

  d(1:n1,1:n2,1:n3) = 0.0;

  for i = 1 : n1
    for j = 1 : n2
      for k = 1 : n3
        if ( ...
          ( ( i == 1 | i == n1 ) & ( j == 1 | j == n2 ) ) | ...
          ( ( i == 1 | i == n1 ) & ( k == 1 | k == n3 ) ) | ...
          ( ( j == 1 | j == n2 ) & ( k == 1 | k == n3 ) ) )
          d(i,j,k) = ( i + j + k );
        end
      end
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLEND_TEST12\n' );
  fprintf ( 1, '  BLEND_113 blends edge values into a table.\n' );
  fprintf ( 1, '\n' );

  r8block_print ( n1, n2, n3, d, '  Initial data array' );

  for i = 1 : n1

    r = ( i - 1 ) / ( n1 - 1 );

    for j = 1 : n2

      s = ( j - 1 ) / ( n2 - 1 );

      for k = 1 : n3

        t = ( k - 1 ) / ( n3 - 1 );

        if ( ...
          ( ( i == 1 | i == n1 ) & ( j == 1 | j == n2 ) ) | ...
          ( ( i == 1 | i == n1 ) & ( k == 1 | k == n3 ) ) | ...
          ( ( j == 1 | j == n2 ) & ( k == 1 | k == n3 ) ) )
          continue
        end

        d(i,j,k) = blend_113 ( r, s, t, ...
          d(1,1,1), d(1,1,n3), d(1,n2,1), d(1,n2,n3), ...
          d(n1,1,1), d(n1,1,n3), d(n1,n2,1), d(n1,n2,n3), ...
          d(i,1,1), d(i,1,n3), d(i,n2,1), d(i,n2,n3), ...
          d(1,j,1), d(1,j,n3), d(n1,j,1), d(n1,j,n3), ...
          d(1,1,k), d(1,n2,k), d(n1,1,k), d(n1,n2,k) );

      end

    end

  end

  r8block_print ( n1, n2, n3, d, '  Interpolated data array' );

  return
end
