function prob_test012 ( )

%*****************************************************************************80
%
%% TEST012 tests BETA_CDF, BETA_CDF_INV, BETA_PDF;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST012\n' );
  fprintf ( 1, '  For the Beta PDF:\n' );
  fprintf ( 1, '  BETA_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  BETA_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  BETA_PDF evaluates the PDF;\n' );

  a = 12.0;
  b = 12.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '  PDF parameter B = %14f\n', b );

  check = beta_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST012 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = beta_sample ( a, b, seed );

    pdf = beta_pdf ( x, a, b );

    cdf = beta_cdf ( x, a, b );

    x2 = beta_cdf_inv ( cdf, a, b );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
