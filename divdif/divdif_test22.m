function divdif_test22 ( )

%*****************************************************************************80
%
%% DIVDIF_TEST22 tests DIF_BASIS_DERIVK;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 June 2013
%
%  Author:
%
%    John Burkardt
%
  nd = 5;
  k = 2;
  xd = [ 1.0, 2.0, 3.0, 4.0, 5.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIVDIF_TEST22\n' );
  fprintf ( 1, '  DIF_BASIS_DERIVK computes difference tables for\n' );
  fprintf ( 1, '  the K-th derivative of each Lagrange basis.\n' );
  
  [ xdp, ddp ] = dif_basis_derivk ( nd, xd, k );
%
%  Because the difference tables were shifted to all 0 abscissas,
%  they contain the polynomial coefficients.
%
  r8mat_transpose_print ( nd - k, nd, ddp, ...
    '  Lagrange basis K-derivative polynomial coefficients:' );

  c = dif_to_r8poly ( nd - k, xdp, ddp(1:nd-k,1) );
  r8poly_print ( nd - k, c, '  P1''=(12x^2-84x+142)/24' );

  c = dif_to_r8poly ( nd - k, xdp, ddp(1:nd-k,2) );
  r8poly_print ( nd - k, c, '  P2''=-2x^2+13x-59/3' );

  c = dif_to_r8poly ( nd - k, xdp, ddp(1:nd-k,3) );
  r8poly_print ( nd - k, c, '  P3''=3x^2-18x+49/2' );

  c = dif_to_r8poly ( nd - k, xdp, ddp(1:nd-k,4) );
  r8poly_print ( nd - k, c, '  P4''=-2x^2+11x-41/3' );

  c = dif_to_r8poly ( nd - k, xdp, ddp(1:nd-k,5) );
  r8poly_print ( nd - k, c, '  P5''=(6x^2-30x+35)/12' );

  return
end

