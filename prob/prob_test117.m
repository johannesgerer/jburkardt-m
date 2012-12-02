function prob_test117 ( )

%*****************************************************************************80
%
%% TEST117 tests NORMAL_CDF, NORMAL_CDF_INV, NORMAL_PDF;
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
  fprintf ( 1, 'TEST117\n' );
  fprintf ( 1, '  For the Normal PDF:\n' );
  fprintf ( 1, '  NORMAL_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  NORMAL_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  NORMAL_PDF evaluates the PDF;\n' );

  a = 100.0;
  b = 15.0;

  check = normal_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST117 - Fatal error!\n' );
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

    [ x, seed ] = normal_sample ( a, b, seed );

    pdf = normal_pdf ( x, a, b );

    cdf = normal_cdf ( x, a, b );

    x2 = normal_cdf_inv ( cdf, a, b );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
