%% TEST02 tests TFQMR on the simple -1,2-1 matrix.
%
%  Discussion:
%
%    This is a very weak test, since the matrix has such a simple
%    structure, is diagonally dominant (though not strictly), 
%    and is symmetric.
%
%    To make the matrix bigger, simply increase the value of N.
%
%  Modified:
%
%    18 June 2007
%
%  Author:
%
%    John Burkardt
%
  clear

  n = 20;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  Test TFQMR on the simple -1,2-1 matrix\n' );
  fprintf ( 1, '  of order N = %d\n', n );
%
%  Set the right hand side.
%
  rhs(1:n-1,1) = 0.0;
  rhs(n,1) = n + 1;
%
%  Set the exact solution.
%
  for i = 1 : n
    x_exact(i,1) = i;
  end
%
%  Set parameters;
%
  iter_max = 20;
  
  params(1) = 1.0E-08;
  params(2) = iter_max;

  for test = 1 : 2
%
%  Set the initial solution estimate.
%
    if ( test == 1 )
      x_init(1:n,1) = 0.0;
    elseif ( test == 2 )
      x_init(1:n,1) = rand(n,1);
    end  

    x_error = norm ( x_exact(1:n,1) - x_init(1:n,1) );
    ax = atx_121 ( x_init );
    r_error = norm ( rhs(1:n,1) - ax(1:n,1) );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Before TFQMR, ||X_ERROR|| = %e\n', x_error );
    fprintf ( 1, '  Before TFQMR, ||A*x-b||   = %e\n', r_error );
%
%  Call the solver.
%
    [ x_new, err, iter_used ] = tfqmr ( x_init, rhs, @atx_121, params );

    x_error = norm ( x_exact(1:n,1) - x_new(1:n,1) );
    ax = atx_121 ( x_new );
    r_error = norm ( rhs(1:n,1) - ax(1:n,1) );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  After TFQMR, ||X_ERROR||  = %e\n', x_error );
    fprintf ( 1, '  After TFQMR, ||A*x-b||    = %e\n', r_error );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  TFQMR took %d iterations\n', iter_used );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  TFQMR residual error history:\n' );
    fprintf ( 1, '\n' );
    for i = 1 : length ( err )
      fprintf ( 1, '  %3d  %e\n', i, err(i) );
    end
  
  end
  
