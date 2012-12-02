function prob_test071 ( )

%*****************************************************************************80
%
%% TEST071 tests FISK_CDF, FISK_CDF_INV, FISK_PDF.
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
  fprintf ( 1, 'TEST071\n' );
  fprintf ( 1, '  For the Fisk PDF:\n' );
  fprintf ( 1, '  FISK_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  FISK_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  FISK_PDF evaluates the PDF;\n' );

  a = 1.0;
  b = 2.0;
  c = 3.0;

  check = fisk_check ( a, b, c );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST071 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %14f\n', a );
  fprintf ( 1, '  PDF parameter B =             %14f\n', b );
  fprintf ( 1, '  PDF parameter C =             %14f\n', c );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = fisk_sample ( a, b, c, seed );

    pdf = fisk_pdf ( x, a, b, c );

    cdf = fisk_cdf ( x, a, b, c );

    x2 = fisk_cdf_inv ( cdf, a, b, c );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
