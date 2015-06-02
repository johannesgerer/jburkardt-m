function laplacian_test01 ( )

%*****************************************************************************80
%
%% LAPLACIAN_TEST01 tests L1DD and similar routines.
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
  fprintf ( 1, 'LAPLACIAN_TEST01\n' );
  fprintf ( 1, '  A full-storage matrix is returned by:\n' );
  fprintf ( 1, '  L1DD: Dirichlet/Dirichlet BC;\n' );
  fprintf ( 1, '  L1DN: Dirichlet/Neumann BC;\n' );
  fprintf ( 1, '  L1ND: Neumann/Dirichlet BC;\n' );
  fprintf ( 1, '  L1NN: Neumann/Neumann BC;\n' );
  fprintf ( 1, '  L1PP: Periodic BC;\n' );

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

    l = l1dn ( n, h );
    r8mat_print ( n, n, l, '  L1DN:' );

    l = l1nd ( n, h );
    r8mat_print ( n, n, l, '  L1ND:' );

    l = l1nn ( n, h );
    r8mat_print ( n, n, l, '  L1NN:' );

    l = l1pp ( n, h );
    r8mat_print ( n, n, l, '  L1PP:' );

  end

  return
end
