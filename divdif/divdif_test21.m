function divdif_test21 ( )

%*****************************************************************************80
%
%% DIVDIF_TEST21tests DIF_BASIS_DERIV;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 June 2013
%
%  Author:
%
%    John Burkardt
%
  nd = 3;
  xd = [ -2.0, 1.0, 5.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIVDIF_TEST21\n' );
  fprintf ( 1, '  DIF_BASIS_DERIV computes difference tables for\n' );
  fprintf ( 1, '  the first derivative of each Lagrange basis.\n' );
  
  [ xdp, ddp ] = dif_basis_deriv ( nd, xd );
%
%  Because the difference tables were shifted to all 0 abscissas,
%  they contain the polynomial coefficients.
%
  r8mat_transpose_print ( nd - 1, nd, ddp, ...
    '  Lagrange basis derivative polynomial coefficients:' );

  c = dif_to_r8poly ( nd - 1, xdp, ddp(1:nd-1,1) );
  r8poly_print ( nd - 1, c, '  P1''=-(2x-6)/21' );

  c = dif_to_r8poly ( nd - 1, xdp, ddp(1:nd-1,2) );
  r8poly_print ( nd - 1, c, '  P2''=-(2x-3)/12' );

  c = dif_to_r8poly ( nd - 1, xdp, ddp(1:nd-1,3) );
  r8poly_print ( nd - 1, c, '  P3''=(2x+1)/28' );

  return
end

