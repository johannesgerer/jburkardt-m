function laplacian_test02 ( )

%*****************************************************************************80
%
%% LAPLACIAN_TEST02 tests L1DD_APPLY and similar functions.
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
  fprintf ( 1, 'LAPLACIAN_TEST02\n' );
  fprintf ( 1, '  The Laplacian L is applied to data U by:\n' );
  fprintf ( 1, '  L1DD_APPLY for Dirichlet/Dirichlet BC;\n' );
  fprintf ( 1, '  L1DN_APPLY for Dirichlet/Neumann BC;\n' );
  fprintf ( 1, '  L1ND_APPLY for Neumann/Dirichlet BC;\n' );
  fprintf ( 1, '  L1NN_APPLY for Neumann/Neumann BC;\n' );
  fprintf ( 1, '  L1PP_APPLY for Periodic BC;\n' );

  n = 9;

  for i = 1 : n
    x(i) = i / ( n + 1 );
  end
  h = 1.0 / ( n + 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using spacing H = %g\n', h );

  u(1:n) = x(1:n) .* ( 1.0 - x(1:n) );

  r8vec_print ( n, u, '  Vector U:' );

  lu = l1dd_apply ( n, h, u );
  r8vec_print ( n, lu, '  L1DD(U):' );

  lu = l1dn_apply ( n, h, u );
  r8vec_print ( n, lu, '  L1DN(U):' );

  lu = l1nd_apply ( n, h, u );
  r8vec_print ( n, lu, '  L1ND(U):' );

  lu = l1nn_apply ( n, h, u );
  r8vec_print ( n, lu, '  L1NN(U):' );

  lu = l1pp_apply ( n, h, u );
  r8vec_print ( n, lu, '  L1PP(U):' );
  
  return
end