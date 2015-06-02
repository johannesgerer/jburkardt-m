function laplacian_test04 ( )

%*****************************************************************************80
%
%% LAPLACIAN_TEST04 tests L1DD_INVERSE and similar routines.
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
  fprintf ( 1, 'LAPLACIAN_TEST04\n' );
  fprintf ( 1, '  The inverse of a full-storage matrix is returned by:\n' );
  fprintf ( 1, '  L1DD_INVERSE: Dirichlet/Dirichlet BC;\n' );
  fprintf ( 1, '  L1DN_INVERSE: Dirichlet/Neumann BC;\n' );
  fprintf ( 1, '  L1ND_INVERSE: Neumann/Dirichlet BC;\n' );

  n = 5;

  for test = 1 : 2

    if ( test == 1 )
      h = 1.0;
    else
      h = 1.0 / ( n + 1 );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Using spacing H = %g\n', h );

    l = l1dd ( n, h );
    r8mat_print ( n, n, l, '  L1DD:' );
    linv = l1dd_inverse ( n, h );
    r8mat_print ( n, n, linv, '  L1DD_INVERSE:' );
    err = inverse_error ( n, l, linv );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  L1DD inverse error = %g\n', err );

    l = l1dn ( n, h );
    r8mat_print ( n, n, l, '  L1DN:' );
    linv = l1dn_inverse ( n, h );
    r8mat_print ( n, n, linv, '  L1DN_INVERSE:' );
    err = inverse_error ( n, l, linv );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  L1DD inverse error = %g\n', err );

    l = l1nd ( n, h );
    r8mat_print ( n, n, l, '  L1ND:' );
    linv = l1nd_inverse ( n, h );
    r8mat_print ( n, n, linv, '  L1ND_INVERSE:' );
    err = inverse_error ( n, l, linv );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  L1DD inverse error = %g\n', err );

  end

  return
end
