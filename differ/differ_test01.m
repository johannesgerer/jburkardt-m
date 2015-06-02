function differ_test01 ( )

%*****************************************************************************80
%
%% DIFFER_TEST01 tests DIFFER_MATRIX.
%
%  Discussion:
%
%    DIFFER_MATRIX computes a modified Vandermonde matrix A1.
%
%    The solution of a system A1 * X1 = B is related to the solution
%    of the system A2 * X2 = B, where A2 is the standard Vandermonde
%    matrix, simply by X2(I) = X1(I) * A(I,1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 November 2013
%
%  Author:
%
%    John Burkardt
%
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIFFER_TEST01\n' );
  fprintf ( 1, '  Demonstrate that the DIFFER matrix is "really"\n' );
  fprintf ( 1, '  a Vandermonde matrix.\n' );

  stencil(1:n,1) = [ 2.5; 3.3; -1.3; 0.5 ];
  x1(1:n,1) = [ 1.0; 2.0; 3.0; 4.0 ];
  a = differ_matrix ( n, stencil );
  r8mat_print ( n, n, a, '  Stencil matrix:' );
  b(1:n,1) = a(1:n,1:n) * x1(1:n,1);
%
%  Set up and solve the DIFFER system.
%
  x1 = a \ b;

  r8vec_print ( n, x1, '  Solution of DIFFER system:' );
%
%  R8VM_SL solves the related Vandermonde system.
%  A simple transformation gives us the solution to the DIFFER system.
%
  job = 0;
  [ x2, info ] = r8vm_sl ( n, stencil, b, job );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST01 - Warning!\n' );
    fprintf ( 1, '  VANDERMONDE system is singular.\n' );
    error ( 'TEST01 - Vandermonde system is singular.' );
    return
  end

  r8vec_print ( n, x2, '  Solution of VANDERMONDE system:' );

  x2(1:n,1) = x2(1:n,1) ./ stencil(1:n,1);
  r8vec_print ( n, x2, '  Transformed solution of VANDERMONDE system:' );

  return
end
