function prob_test154 ( )

%*****************************************************************************80
%
%% TEST154 tests VON_MISES_CDF, VON_MISES_CDF_INV, VON_MISES_PDF.
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
  fprintf ( 1, 'TEST154\n' );
  fprintf ( 1, '  For the Von Mises PDF:\n' );
  fprintf ( 1, '  VON_MISES_CDF evaluates the CDF.\n' );
  fprintf ( 1, '  VON_MISES_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  VON_MISES_PDF evaluates the PDF.\n' );

  a = 1.0;
  b = 2.0;

  check = von_mises_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST154 - Fatal error!\n' );
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

    [ x, seed ] = von_mises_sample ( a, b, seed );

    pdf = von_mises_pdf ( x, a, b );

    cdf = von_mises_cdf ( x, a, b );

    x2 = von_mises_cdf_inv ( cdf, a, b );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
