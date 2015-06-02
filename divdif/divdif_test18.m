function divdif_test18 ( )

%*****************************************************************************80
%
%% DIVDIF_TEST18 tests ROOTS_TO_DIF and DIF_TO_R8POLY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIVDIF_TEST18\n' );
  fprintf ( 1, '  ROOTS_TO_DIF computes the divided difference\n' );
  fprintf ( 1, '  polynomial with given roots;\n' );
  fprintf ( 1, '  DIF_TO_R8POLY converts it to a standard form\n' );
  fprintf ( 1, '  polynomial.\n' );
  fprintf ( 1, '\n' );

  nroots = 1;
  roots(1) = 3.0;
  r8vec_print ( nroots, roots, '  The roots:' );

  [ ntab, xtab, diftab ] = roots_to_dif ( nroots, roots );

  c = dif_to_r8poly ( ntab, xtab, diftab );

  r8poly_print ( ntab, c, '  The polynomial:' );

  nroots = 2;
  roots(1:2) = [ 3.0, 1.0 ];
  r8vec_print ( nroots, roots, '  The roots:' );

  [ ntab, xtab, diftab ] = roots_to_dif ( nroots, roots );

  c = dif_to_r8poly ( ntab, xtab, diftab );

  r8poly_print ( ntab, c, '  The polynomial:' );

  nroots = 3;
  roots(1:3) = [ 3.0, 1.0, 2.0 ];
  r8vec_print ( nroots, roots, '  The roots:' );

  [ ntab, xtab, diftab ] = roots_to_dif ( nroots, roots );

  c = dif_to_r8poly ( ntab, xtab, diftab );

  r8poly_print ( ntab, c, '  The polynomial:' );

  nroots = 4;
  roots(1:4) = [ 3.0, 1.0, 2.0, 4.0 ];
  r8vec_print ( nroots, roots, '  The roots:' );

  [ ntab, xtab, diftab ] = roots_to_dif ( nroots, roots );

  c = dif_to_r8poly ( ntab, xtab, diftab );

  r8poly_print ( ntab, c, '  The polynomial:' );

  return
end
