function laplacian_test06 ( )

%*****************************************************************************80
%
%% LAPLACIAN_TEST06 tests L1DD_LU and similar routines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAPLACIAN_TEST06\n' );
  fprintf ( 1, '  Compute LU factors for the Laplacian:\n' );
  fprintf ( 1, '  L1DD_LU for Dirichlet/Dirichlet BC;\n' );
  fprintf ( 1, '  L1DN_LU for Dirichlet/Neumann BC;\n' );
  fprintf ( 1, '  L1ND_LU for Neumann/Dirichlet BC;\n' );
  fprintf ( 1, '  L1NN_LU for Neumann/Neumann BC;\n' );
  fprintf ( 1, '  L1PP_LU for Periodic BC;\n' );

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
    [ l, u ] = l1dd_lu ( n, h );
    r8mat_print ( n, n, l, '  L1DD L factor:' );
    r8mat_print ( n, n, u, '  L1DD U factor:' );
    err = lu_error ( n, a, l, u );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  L1DD LU error = %g\n', err );

    a = l1dn ( n, h );
    [ l, u ] = l1dn_lu ( n, h );
    r8mat_print ( n, n, l, '  L1DN L factor:' );
    r8mat_print ( n, n, u, '  L1DN U factor:' );
    err = lu_error ( n, a, l, u );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  L1DN LU error = %g\n', err );

    a = l1nd ( n, h );
    [ l, u ] = l1nd_lu ( n, h );
    r8mat_print ( n, n, l, '  L1ND L factor:' );
    r8mat_print ( n, n, u, '  L1ND U factor:' );
    err = lu_error ( n, a, l, u );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  L1ND LU error = %g\n', err );

    a = l1nn ( n, h );
    [ l, u ] = l1nn_lu ( n, h );
    r8mat_print ( n, n, l, '  L1NN L factor:' );
    r8mat_print ( n, n, u, '  L1NN U factor:' );
    err = lu_error ( n, a, l, u );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  L1NN LU error = %g\n', err );

    a = l1pp ( n, h );
    [ l, u ] = l1pp_lu ( n, h );
    r8mat_print ( n, n, l, '  L1PP L factor:' );
    r8mat_print ( n, n, u, '  L1PP U factor:' );
    err = lu_error ( n, a, l, u );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  L1PP LU error = %g\n', err );

  end

  return
end
