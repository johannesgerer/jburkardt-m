function subpak_test076 ( )

%*****************************************************************************80
%
%% TEST076 tests R8MAT_POWER_METHOD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST076\n' );
  fprintf ( 1, '  R8MAT_POWER_METHOD applies the power method\n' );
  fprintf ( 1, '  to a matrix.\n' );

  for i = 1 : n
    for j = 1 : n
      if ( j == i - 1 || j == i + 1 )
        a(i,j) = -1.0;
      elseif ( j == i )
        a(i,j) = 2.0;
      else
        a(i,j) = 0.0;
      end
    end
  end

  v(1:n) = 0.0;

  [ r, v ] = r8mat_power_method ( n, a, v );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimated eigenvalue = %f\n', r );

  r8vec_print ( n, v, '  Estimated eigenvector V:' );

  av(1:n) = a(1:n,1:n) * v(1:n)';

  r8vec_print ( n, av, '  Value of A*V:' );

  return
end
