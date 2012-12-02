function prob_test088 ( )

%*****************************************************************************80
%
%% TEST088 tests HALF_NORMAL_CDF, HALF_NORMAL_CDF_INV, HALF_NORMAL_PDF;
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
  fprintf ( 1, 'TEST088\n' );
  fprintf ( 1, '  For the Half Normal PDF:\n' );
  fprintf ( 1, '  HALF_NORMAL_CDF evaluates the CDF.\n' );
  fprintf ( 1, '  HALF_NORMAL_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  HALF_NORMAL_PDF evaluates the PDF.\n' );

  a = 0.0;
  b = 2.0;

  check = half_normal_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST088 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =         %14f\n', a );
  fprintf ( 1, '  PDF parameter B =         %14f\n', b );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = half_normal_sample ( a, b, seed );

    pdf = half_normal_pdf ( x, a, b );

    cdf = half_normal_cdf ( x, a, b );

    x2 = half_normal_cdf_inv ( cdf, a, b );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
