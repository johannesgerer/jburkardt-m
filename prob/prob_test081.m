function prob_test081 ( )

%*****************************************************************************80
%
%% PROB_TEST081 tests GEOMETRIC_CDF, *_CDF_INV, *_PDF;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PROB_TEST081\n' );
  fprintf ( 1, '  For the Geometric PDF:\n' );
  fprintf ( 1, '  GEOMETRIC_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  GEOMETRIC_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  GEOMETRIC_PDF evaluates the PDF;\n' );

  a = 0.25;

  check = geometric_check ( a );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PROB_TEST081 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = geometric_sample ( a, seed );

    pdf = geometric_pdf ( x, a );

    cdf = geometric_cdf ( x, a );

    x2 = geometric_cdf_inv ( cdf, a );

    fprintf ( 1, '  %14d  %14f  %14f  %14d\n', x, pdf, cdf, x2 );

  end

  return
end
