function prob_test1304 ( )

%*****************************************************************************80
%
%% PROB_TEST1304 tests QUASIGEOMETRIC_CDF, *_CDF_INV, *_PDF;
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
  fprintf ( 1, 'PROB_TEST1304\n' );
  fprintf ( 1, '  For the Quasigeometric PDF:\n' );
  fprintf ( 1, '  QUASIGEOMETRIC_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  QUASIGEOMETRIC_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  QUASIGEOMETRIC_PDF evaluates the PDF;\n' );

  a = 0.4825;
  b = 0.5893;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '  PDF parameter B = %14f\n', b );

  check = quasigeometric_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PROB_TEST081 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = quasigeometric_sample ( a, b, seed );

    pdf = quasigeometric_pdf ( x, a, b );

    cdf = quasigeometric_cdf ( x, a, b );

    x2 = quasigeometric_cdf_inv ( cdf, a, b );

    fprintf ( 1, '  %14d  %14f  %14f  %14d\n', x, pdf, cdf, x2 );

  end

  return
end
