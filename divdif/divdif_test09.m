function divdif_test09 ( )

%*****************************************************************************80
%
%% DIVDIF_TEST09 tests R8POLY_ANT_COF, R8POLY_ANT_VAL, R8POLY_DER_COF, R8POLY_DER_VAL, R8POLY_PRINT, R8POLY_VAL.
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
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIVDIF_TEST09\n' );
  fprintf ( 1, '  R8POLY_ANT_COF computes the coefficients of the\n' );
  fprintf ( 1, '  antiderivative of a polynomial;\n' );
  fprintf ( 1, '  R8POLY_ANT_VAL evaluates the antiderivative of\n' );
  fprintf ( 1, '  a polynomial;\n' );
  fprintf ( 1, '  R8POLY_DER_COF computes the coefficients of the\n' );
  fprintf ( 1, '  derivative of a polynomial;\n' );
  fprintf ( 1, '  R8POLY_DER_VAL evaluates the derivative of\n' );
  fprintf ( 1, '  a polynomial;\n' );
  fprintf ( 1, '  R8POLY_PRINT prints a polynomial;\n' );
  fprintf ( 1, '  R8POLY_VAL evaluates a polynomial.\n' );

  for i = 1 : n
    poly_cof(i) = i;
  end

  r8poly_print ( n, poly_cof, '  Our initial polynomial:' );

  poly_cof2 = r8poly_ant_cof ( n, poly_cof );

  r8poly_print ( n+1, poly_cof2, '  The antiderivative polynomial:' );

  poly_cof3 = r8poly_der_cof ( n, poly_cof );

  r8poly_print ( n-1, poly_cof3, '  The derivative polynomial:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Evaluate the polynomial, antiderivative and\n' );
  fprintf ( 1, '  derivative, using only the original polynomial\n' );
  fprintf ( 1, '  coefficients:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     X             P(X)         Anti_P(X)     P''(X)\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 2

    xval = i;

    yval = r8poly_val_horner ( n, poly_cof, xval );

    yval2 = r8poly_ant_val ( n, poly_cof, xval );

    yval3 = r8poly_der_val ( n, poly_cof, xval );

    fprintf ( 1, '  %14f  %14f  %14f  %14f\n', xval, yval, yval2, yval3 );

  end

  return
end
