function linplus_test40 ( )

%*****************************************************************************80
%
%% TEST40 tests R8GE_SL_IT.
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
  n = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST40\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  R8GE_SL_IT applies one step of iterative \n' );
  fprintf ( 1, '    refinement to a R8GE_SL solution.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the coefficient matrix.
%
  a = hilbert_inverse ( n );
%
%  Set the right hand side b.
%
  b(1:n-1) = 0.0E+00;
  b(n) = 1.0E+00;
%
%  Compute the factored coefficient matrix.
%
  [ a_lu, pivot, info ] = r8ge_fa ( n, a );

  if ( info ~= 0 ) then
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST40 - Fatal error!\n' );
    fprintf ( 1, '  R8GE_FA declares the matrix is singular!\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return
  end
%
%  Solve the system.
%  (Careful!  R8GE_SL overwrites the right hand side with the solution!)
%
  job = 1;
  x = r8ge_sl ( n, a_lu, pivot, b, job );
%
%  Compute and print the residual.
%
  r = r8ge_res ( n, n, a, x, b );

  r8vec2_print_some ( n, x, r, 10, '  i, x, b-A*x' );
%
%  Take a few steps of iterative refinement.
%
  for j = 1 : 5

    fprintf ( 1, '\n' );
    fprintf ( 1, 'Iterative refinement step %d\n', j );
    fprintf ( 1, '\n' );
%
%  Improve the solution.
%
    [ x_new, r ] = r8ge_sl_it ( n, a, a_lu, pivot, b, job, x );

    r8vec_print_some ( n, r, 1, 10, '  I, DX:' );
%
%  Compute and print the residual.
%
    r = r8ge_res ( n, n, a, x_new, b );

    r8vec2_print_some ( n, x_new, r, 10, '  i, x, b-A*x' );

    x(1:n) = x_new(1:n);

  end

  return
end
