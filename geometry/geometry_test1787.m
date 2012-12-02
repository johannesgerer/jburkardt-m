function geometry_test1787 ( )

%*****************************************************************************80
%
%% TEST1787 tests DGE_FA, DGE_SL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1787\n' );
  fprintf ( 1, '  DGE_FA factors a general linear system,\n' );
  fprintf ( 1, '  DGE_SL solves a factored system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  seed = 123456789;
  [ a, seed ] = r8mat_uniform_01 ( n, n, seed );
  r8mat_print ( n, n, a, '  Matrix A.' );
%
%  Set the desired solution.
%
  for i = 1 : n
    x(i) = i;
  end
%
%  Compute the corresponding right hand side.
%
  b(1:n) = a(1:n,1:n) * x(1:n)';
%
%  Factor the matrix.
%
  [ alu, pivot, info ] = dge_fa ( n, a );

  r8mat_print ( n, n, alu, '  Factored ALU matrix.' );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Fatal error!\n' );
    fprintf ( 1, '  DGE_FA declares the matrix is singular!\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return
  end
%
%  Solve the linear system.
%
  job = 0;
  x(1:n) = dge_sl ( n, alu, pivot, b, job );

  r8vec_print ( n, x, '  Solution: (Should be 1, 2, 3,...)' );
%
%  Set another desired solution.
%
  x(1:n) = 1.0;
%
%  Compute the corresponding right hand side.
%
  b(1:n) = a(1:n,1:n) * x(1:n)';
%
%  Solve the system
%
  job = 0;
  x(1:n) = dge_sl ( n, alu, pivot, b, job );

  r8vec_print ( n, x, '  Solution: (Should be 1, 1, 1,...)' );
%
%  Set the desired solution.
%
  for i = 1 : n
    x(i) = i;
  end
%
%  Compute the corresponding right hand side.
%
  b(1:n) = a(1:n,1:n)' * x(1:n)';
%
%  Solve the system.
%
  job = 1;
  x = dge_sl ( n, alu, pivot, b, job );

  r8vec_print ( n, x, ...
    '  Solution of transposed system: (Should be 1, 2, 3,...)' );

  return
end
