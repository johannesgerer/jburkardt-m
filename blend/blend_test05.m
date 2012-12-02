function blend_test05 ( )

%*****************************************************************************80
%
%% BLEND_TEST05 checks out BLEND_IJK_0D1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2008
%
%  Author:
%
%    John Burkardt
%
  m1 = 4;
  m2 = 3;
  m3 = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLEND_TEST05\n' );
  fprintf ( 1, '  BLEND_IJK_0D1 interpolates data in a table,\n' );
  fprintf ( 1, '  from corner data.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The table is %d rows by %d columns by %d layers.\n', ...
    m1, m2, m3 );
%
%  Load data on the faces.
%
  for i = 1 : m1
    r = ( i - 1 ) / ( m1 - 1 );
    for j = 1 : m2
      s = ( j - 1 ) / ( m2 - 1 );
      for k = 1 : m3
        t = ( k - 1 ) / ( m3 - 1 );

        num_extreme = 0;
        if ( i == 1 | i == m1 )
          num_extreme = num_extreme + 1;
        end
        if ( j == 1 | j == m2 )
          num_extreme = num_extreme + 1;
        end
        if ( k == 1 | k == m3 )
          num_extreme = num_extreme + 1;
        end

        if ( num_extreme == 3 )
          x(i,j,k) = quad_rst ( r, s, t, 1 );
        else
          x(i,j,k) = 0.0;
        end

      end
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data given to BLEND_IJK_0D1:\n' );
  fprintf ( 1, '\n' );

  for k = 1 : m3
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Layer K = %d\n', k );
    fprintf ( 1, '\n' );
    for i = 1 : m1
      fprintf ( 1, '  %10f  %10f  %10f\n', x(i,1:m2,k) );
    end
  end

  x = blend_ijk_0d1 ( x, m1, m2, m3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Values interpolated by BLEND_IJK_0D1:\n' );
  fprintf ( 1, '\n' );

  for k = 1 : m3
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Layer K = %d\n', k );
    fprintf ( 1, '\n' );
    for i = 1 : m1
      fprintf ( 1, '  %10f  %10f  %10f\n', x(i,1:m2,k) );
    end
  end
%
%  Load all data.
%
  for i = 1 : m1
    r = ( i - 1 ) / ( m1 - 1 );
    for j = 1 : m2
      s = ( j - 1 ) / ( m2 - 1 );
      for k = 1 : m3
        t = ( k - 1 ) / ( m3 - 1 );
        x(i,j,k) = quad_rst ( r, s, t, 1 );
      end
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Exact data:\n' );
  fprintf ( 1, '\n' );

  for k = 1 : m3
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Layer K = %d\n', k );
    fprintf ( 1, '\n' );
    for i = 1 : m1
      fprintf ( 1, '  %10f  %10f  %10f\n', x(i,1:m2,k) );
    end
  end

  return
end
