function divdif_test06 ( )

%*****************************************************************************80
%
%% DIVDIF_TEST06 tests DIF_TO_R8POLY and DIF_SHIFT_ZERO.
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
  maxtab = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIVDIF_TEST06\n' );
  fprintf ( 1, '  DIF_TO_R8POLY converts a difference table to a\n' );
  fprintf ( 1, '  polynomial;\n' );
  fprintf ( 1, '  DIF_SHIFT_ZERO shifts a divided difference\n' );
  fprintf ( 1, '  table to all zero abscissas;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  These are equivalent operations!\n' );
  fprintf ( 1, '\n' );
%
%  Set XTAB, YTAB to X, F(X)
%
  ntab = 4;

  xtab1 = r8vec_indicator ( ntab );

  ytab1(1:ntab) = xtab1(1:ntab).^3 - 2.0 * xtab1(1:ntab).^2 ...
    + 3.0 * xtab1(1:ntab) - 4.0;

  xtab2 = r8vec_indicator ( ntab );

  ytab2(1:ntab) = xtab2(1:ntab).^3 - 2.0 * xtab2(1:ntab).^2 ...
    + 3.0 * xtab2(1:ntab) - 4.0;
%
%  Compute and display the finite difference table.
%
  diftab1 = data_to_dif_display ( ntab, xtab1, ytab1 );

  diftab2 = data_to_dif_display ( ntab, xtab2, ytab2 );
%
%  Examine corresponding polynomial.
%
  dif_print ( ntab, xtab1, diftab1, '  The divided difference polynomial:' );
%
%  Shift to zero.
%
  [ xtab1, diftab1 ] = dif_shift_zero ( ntab, xtab1, diftab1 );

  r8poly_print ( ntab, diftab1, '  Using DIF_SHIFT_ZERO' );
%
%  Shift to zero.
%
  c = dif_to_r8poly ( ntab, xtab2, diftab2 );

  r8poly_print ( ntab, c, '  Using DIF_TO_R8POLY' );

  return
end
