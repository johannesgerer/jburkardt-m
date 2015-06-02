function laplacian_test03 ( )

%*****************************************************************************80
%
%% LAPLACIAN_TEST03 tests L1DD_EIGEN and similar routines.
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
  fprintf ( 1, 'LAPLACIAN_TEST03\n' );
  fprintf ( 1, '  Compute eigen information for the Laplacian:\n' );
  fprintf ( 1, '  L1DD_EIGEN for Dirichlet/Dirichlet BC;\n' );
  fprintf ( 1, '  L1DN_EIGEN for Dirichlet/Neumann BC;\n' );
  fprintf ( 1, '  L1ND_EIGEN for Neumann/Dirichlet BC;\n' );
  fprintf ( 1, '  L1NN_EIGEN for Neumann/Neumann BC;\n' );
  fprintf ( 1, '  L1PP_EIGEN for Periodic BC;\n' );

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
    [ v, lambda ] = l1dd_eigen ( n, h );
    r8vec_print ( n, lambda, '  L1DD Eigenvalues:' );
    r8mat_print ( n, n, v, '  L1DD Eigenvectors:' );
    err = eigen_error ( n, n, a, v, lambda );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  L1DD eigenerror = %g\n', err );

    a = l1dn ( n, h );
    [ v, lambda ] = l1dn_eigen ( n, h );
    r8vec_print ( n, lambda, '  L1DN Eigenvalues:' );
    r8mat_print ( n, n, v, '  L1DN Eigenvectors:' );
    err = eigen_error ( n, n, a, v, lambda );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  L1DN eigenerror = %g\n', err );

    a = l1nd ( n, h );
    [ v, lambda ] = l1nd_eigen ( n, h );
    r8vec_print ( n, lambda, '  L1ND Eigenvalues:' );
    r8mat_print ( n, n, v, '  L1ND Eigenvectors:' );
    err = eigen_error ( n, n, a, v, lambda );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  L1ND eigenerror = %g\n', err );

    a = l1nn ( n, h );
    [ v, lambda ] = l1nn_eigen ( n, h );
    r8vec_print ( n, lambda, '  L1NN Eigenvalues:' );
    r8mat_print ( n, n, v, '  L1NN Eigenvectors:' );
    err = eigen_error ( n, n, a, v, lambda );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  L1NN eigenerror = %g\n', err );

    a = l1pp ( n, h );
    [ v, lambda ] = l1pp_eigen ( n, h );
    r8vec_print ( n, lambda, '  L1PP Eigenvalues:' );
    r8mat_print ( n, n, v, '  L1PP Eigenvectors:' );
    err = eigen_error ( n, n, a, v, lambda );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  L1PP eigenerror = %g\n', err );

  end

  return
end
