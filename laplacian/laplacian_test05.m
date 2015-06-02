function laplacian_test05 ( )

%*****************************************************************************80
%
%% LAPLACIAN_TEST05 tests L1DD_CHOLESKY and similar routines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 October 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAPLACIAN_TEST05\n' );
  fprintf ( 1, '  Compute upper Cholesky factors for the Laplacian:\n' );
  fprintf ( 1, '  L1DD_CHOLESKY for Dirichlet/Dirichlet BC;\n' );
  fprintf ( 1, '  L1DN_CHOLESKY for Dirichlet/Neumann BC;\n' );
  fprintf ( 1, '  L1ND_CHOLESKY for Neumann/Dirichlet BC;\n' );
  fprintf ( 1, '  L1NN_CHOLESKY for Neumann/Neumann BC;\n' );
  fprintf ( 1, '  L1PP_CHOLESKY for Periodic BC;\n' );

  n = 5;

  for test = 1 : 2

    if ( test == 1 )
      h = 1.0;
    else
      h = 1.0 / ( n + 1 );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using spacing H = %g\n', h );

    a = l1dd ( n, h );
    c = l1dd_cholesky ( n, h );
    r8mat_print ( n, n, c, '  L1DD Cholesky factor:' );
    err = cholesky_upper_error ( n, a, c );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  L1DD Cholesky error = %g\n', err );

    a = l1dn ( n, h );
    c = l1dn_cholesky ( n, h );
    r8mat_print ( n, n, c, '  L1DN Cholesky factor:' );
    err = cholesky_upper_error ( n, a, c );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  L1DN Cholesky error = %g\n', err );

    a = l1nd ( n, h );
    c = l1nd_cholesky ( n, h );
    r8mat_print ( n, n, c, '  L1ND Cholesky factor:' );
    err = cholesky_upper_error ( n, a, c );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  L1ND Cholesky error = %g\n', err );

    a = l1nn ( n, h );
    c = l1nn_cholesky ( n, h );
    r8mat_print ( n, n, c, '  L1NN Cholesky factor:' );
    err = cholesky_upper_error ( n, a, c );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  L1NN Cholesky error = %g\n', err );

    a = l1pp ( n, h );
    c = l1pp_cholesky ( n, h );
    r8mat_print ( n, n, c, '  L1PP Cholesky factor:' );
    err = cholesky_upper_error ( n, a, c );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  L1PP Cholesky error = %g\n', err );

  end

  return
end
