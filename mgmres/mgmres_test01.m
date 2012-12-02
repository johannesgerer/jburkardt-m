function mgmres_test01 ( )

%*****************************************************************************80
%
%% MGMRES_TEST01 tests MGMRES_ST on the simple -1,2-1 matrix.
%
%  Discussion:
%
%    This is a very weak test, since the matrix has such a simple
%    structure, is diagonally dominant (though not strictly), 
%    and is symmetric.
%
%    To make the matrix bigger, simply increase the value of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 July 2007
%
%  Author:
%
%    John Burkardt
%
  n = 20;
  nz_num = 3 * n - 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MGMRES_TEST01\n' );
  fprintf ( 1, '  Test MGMRES_ST on the simple -1,2-1 matrix.\n' );
%
%  Set the matrix.
%
  k = 0;

  for i = 1 : n

    if ( 1 < i )
      k = k + 1;
      ia(k) = i;
      ja(k) = i-1;
      a(k) = -1.0;
    end

    k = k + 1;
    ia(k) = i;
    ja(k) = i;
    a(k) = 2.0;

    if ( i < n )
      k = k + 1;
      ia(k) = i;
      ja(k) = i+1;
      a(k) = -1.0;
    end

  end
%
%  Set the right hand side:
%
  rhs(1:n-1) = 0.0;
  rhs(n) = n + 1;
%
%  Set the exact solution.
%
  for i = 1 : n
    x_exact(i) = i;
  end

  for test = 1 : 3
%
%  Set the initial solution estimate.
%
    x_estimate(1:n) = 0.0;

    x_error = norm ( x_exact(1:n) - x_estimate(1:n) );

    if ( test == 1 )
      itr_max = 1;
      mr = 20;
    elseif ( test == 2 )
      itr_max = 2;
      mr = 10;
    elseif ( test == 3 )
      itr_max = 5;
      mr = 4;
    end

    tol_abs = 1.0E-08;
    tol_rel = 1.0E-08;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Test %d\n', test );
    fprintf ( 1, '  Matrix order N = %d\n', n );
    fprintf ( 1, '  Inner iteration limit = %d\n', mr );
    fprintf ( 1, '  Outer iteration limit = %d\n', itr_max );
    fprintf ( 1, '  Initial X_ERROR = %e\n', x_error );

    x_estimate = mgmres_st ( n, nz_num, ia, ja, a, x_estimate, rhs, itr_max, ...
      mr, tol_abs, tol_rel );

    x_error = norm ( x_exact(1:n) - x_estimate(1:n) );

    fprintf ( 1, '  Final X_ERROR = %e\n', x_error );

  end

  return
end
