function linplus_test49 ( )

%*****************************************************************************80
%
%% TEST49 tests R8PBU_SOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 50;
  mu = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST49\n' );
  fprintf ( 1, '  R8PBU_SOR, SOR routine for iterative\n' );
  fprintf ( 1, '    solution of A*x=b.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
  fprintf ( 1, '  Upper bandwidth MU = %d\n', mu );

  for k = 1 : 3
 
    if ( k == 1 )
      omega = 0.25E+00;
    elseif ( k == 2 )
      omega = 0.75E+00;
    else
      omega = 1.00E+00;
    end
%
%  Set matrix values.
%
    a(2,1:n) = 2.0E+00;

    a(1,1) = 0.0E+00;
    a(1,2:n) = -1.0E+00;
%
%  Set the desired solution.
%
    for i = 1 : n
      t = pi * ( i - 1 ) / ( n - 1 );
      x(i) = sin ( t );
    end
%
%  Compute the right hand side.
%
    b = r8pbu_mxv ( n, mu, a, x );
%
%  Set the initial solution estimate.
%
    x(1:n) = 1.0E+00;
 
    itchk = 1;
    itmax = 8000;
    eps = 0.0001E+00;

    [ x, itknt ] = r8pbu_sor ( n, mu, a, b, eps, itchk, itmax, omega, x );
%
%  Compute residual, A*x-b
%
    b2 = r8pbu_mxv ( n, mu, a, x );
 
    err = 0.0E+00;
    for i = 1 : n
      err = max ( err, abs ( b2(i) - b(i) ) );
    end
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '  SOR iteration.\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Relaxation factor OMEGA = %f\n', omega );
    fprintf ( 1, '  Iterations taken = %d\n', itknt );

    r8vec_print_some ( n, x, 1, 10, '  Solution:' );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Maximum error = %f\n', err );
 
  end

  return
end
