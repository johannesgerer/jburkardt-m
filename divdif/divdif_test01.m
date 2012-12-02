function divdif_test01 ( )

%*****************************************************************************80
%
%% DIVDIF_TEST01 tests DIF_APPEND, DIF_ANTIDERIV, DIF_DERIV_TABLE, DIF_SHIFT_ZERO, DIF_VAL;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2011
%
%  Author:
%
%    John Burkardt
%
  maxtab = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIVDIF_TEST01\n' );
  fprintf ( 1, '  For a divided difference polynomial:\n' );
  fprintf ( 1, '  DATA_TO_DIF_DISPLAY sets up a difference table\n' );
  fprintf ( 1, '  and displays intermediate calculations;\n' );
  fprintf ( 1, '  DIF_APPEND appends a new data point;\n' );
  fprintf ( 1, '  DIF_ANTIDERIV computes the antiderivative;\n' );
  fprintf ( 1, '  DIF_DERIV_TABLE computes the derivative;\n' );
  fprintf ( 1, '  DIF_SHIFT_ZERO shifts all the abscissas to 0;\n' );
  fprintf ( 1, '  DIF_VAL evaluates at a point.\n' );
  fprintf ( 1, '\n' );
%
%  Set XTAB, YTAB to X, X^2.
%
  ntab = 4;
  xtab = r8vec_indicator ( ntab );
  ytab(1:ntab) = xtab(1:ntab).^2;

  diftab = data_to_dif_display ( ntab, xtab, ytab );

  dif_print ( ntab, xtab, diftab, '  The divided difference polynomial:' );
%
%  Append (5,25) to the table.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Append the data (5,25) to the table.\n' );
  fprintf ( 1, '\n' );

  ntab = ntab + 1;
  xval = 5.0;
  yval = 25.0;

  [ ntab, xtab, diftab ] = dif_append ( ntab, xtab, diftab, xval, yval );

  dif_print ( ntab, xtab, diftab, ...
    '  The augmented divided difference polynomial:' );
%
%  Evaluate the polynomial at 2.5.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Evaluate the table at a point.\n' );
  fprintf ( 1, '\n' );

  xval = 2.5;

  yval = dif_val ( ntab, xtab, diftab, xval );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   P(%f) =  %f\n', xval, yval );
%
%  Shift the base to zero.
%
  [ xtab, diftab ] = dif_shift_zero ( ntab, xtab, diftab );

  dif_print ( ntab, xtab, diftab, '  The table, rebased at 0:' );
%
%  Compute a table for the derivative.
%
  [ ntab2, xtab2, diftab2 ] = dif_deriv_table ( ntab, xtab, diftab );

  dif_print ( ntab2, xtab2, diftab2, '  The derivative:' );

  yval = dif_val ( ntab2, xtab2, diftab2, xval );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   P''(%f) =  %f\n', xval, yval );
%
%  Compute the antiderivative.
%
  [ ntab3, xtab3, diftab3 ] = dif_antideriv ( ntab, xtab, diftab );

  dif_print ( ntab3, xtab3, diftab3, '  The antiderivative:' );

  yval = dif_val ( ntab3, xtab3, diftab3, xval );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   (Anti)P(%f) =  %f\n', xval, yval );

  return
end
