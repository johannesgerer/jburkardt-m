function linplus_test04 ( )

%*****************************************************************************80
%
%% TEST04 tests R83_JAC_SL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  n = 100;
  maxit = 1000;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  For a real tridiagonal system,\n' );
  fprintf ( 1, '  R83_JAC_SL solves a linear system using\n' );
  fprintf ( 1, '    Jacobi iteration\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
  fprintf ( 1, '  Iterations per call = %d\n', maxit );
  fprintf ( 1, '\n' );
%
%  Set the matrix values.
%
  a(1,1)     =  0.0E+00;
  a(1,2:n)   = -1.0E+00;
  a(2,1:n)   =  2.0E+00;
  a(3,1:n-1) = -1.0E+00;
  a(3,n)     =  0.0E+00;

  for job = 0 : 1

    if ( job == 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Solving A * x = b.\n' );
      fprintf ( 1, '\n' );
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Solving A'' * x = b.\n' );
      fprintf ( 1, '\n' );
    end
%
%  Set the desired solution.
%
    x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
    if ( job == 0 )
      b = r83_mxv ( n, a, x );
    else
      b = r83_vxm ( n, a, x );
    end
%
%  Set the starting solution.
%
    x(1:n) = 0.0E+00;
%
%  Solve the linear system.
%
    for i = 1 : 3

      x_new = r83_jac_sl ( n, a, b, x, maxit, job );

      r8vec_print_some ( n, x_new, 1, 10, '  Current solution estimate:' );

      x(1:n) = x_new(1:n);
      
    end

  end

  return
end
