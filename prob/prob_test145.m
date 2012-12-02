function prob_test145 ( )

%*****************************************************************************80
%
%% TEST145 tests TRIANGULAR_CDF, TRIANGULAR_CDF_INV, TRIANGULAR_PDF;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST145\n' );
  fprintf ( 1, '  For the Triangular PDF:\n' );
  fprintf ( 1, '  TRIANGULAR_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  TRIANGULAR_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  TRIANGULAR_PDF evaluates the PDF;\n' );

  a = 1.0;
  b = 10.0;

  check = triangular_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST145 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =      %14f\n', a );
  fprintf ( 1, '  PDF parameter B =      %14f\n', b );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = triangular_sample ( a, b, seed );

    pdf = triangular_pdf ( x, a, b );

    cdf = triangular_cdf ( x, a, b );

    x2 = triangular_cdf_inv ( cdf, a, b );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
