function prob_test129 ( )

%*****************************************************************************80
%
%% TEST129 tests POWER_CDF, POWER_CDF_INV, POWER_PDF;
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
  fprintf ( 1, 'TEST129\n' );
  fprintf ( 1, '  For the Power PDF:\n' );
  fprintf ( 1, '  POWER_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  POWER_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  POWER_PDF evaluates the PDF;\n' );

  a = 2.0;
  b = 3.0;

  check = power_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST129 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =       %14f\n', a );
  fprintf ( 1, '  PDF parameter B =       %14f\n', b );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = power_sample ( a, b, seed );

    pdf = power_pdf ( x, a, b );

    cdf = power_cdf ( x, a, b );

    x2 = power_cdf_inv ( cdf, a, b );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
