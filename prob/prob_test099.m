function prob_test099 ( )

%*****************************************************************************80
%
%% TEST099 tests LOG_NORMAL_CDF, LOG_NORMAL_CDF_INV, LOG_NORMAL_PDF.
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
  fprintf ( 1, 'TEST099\n' );
  fprintf ( 1, '  For the Lognormal PDF:\n' );
  fprintf ( 1, '  LOG_NORMAL_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  LOG_NORMAL_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  LOG_NORMAL_PDF evaluates the PDF;\n' );

  a = 10.0;
  b = 2.25;

  check = log_normal_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST099 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %14f\n', a );
  fprintf ( 1, '  PDF parameter B =             %14f\n', b );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = log_normal_sample ( a, b, seed );

    pdf = log_normal_pdf ( x, a, b );

    cdf = log_normal_cdf ( x, a, b );

    x2 = log_normal_cdf_inv ( cdf, a, b );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
