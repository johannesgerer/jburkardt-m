function prob_test127 ( )

%*****************************************************************************80
%
%% TEST127 tests POISSON_CDF, POISSON_CDF_INV, POISSON_PDF.
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
  fprintf ( 1, 'TEST127\n' );
  fprintf ( 1, '  For the Poisson PDF:\n' );
  fprintf ( 1, '  POISSON_CDF evaluates the CDF,\n' );
  fprintf ( 1, '  POISSON_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  POISSON_PDF evaluates the PDF.\n' );

  a = 10.0;

  check = poisson_check ( a );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST127 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =  %14f\n', a );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = poisson_sample ( a, seed );

    pdf = poisson_pdf ( x, a );

    cdf = poisson_cdf ( x, a );

    x2 = poisson_cdf_inv ( cdf, a );

    fprintf ( 1, '  %14d  %14f  %14f  %14d\n', x, pdf, cdf, x2 );

  end

  return
end
