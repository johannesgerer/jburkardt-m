function prob_test0235 ( )

%*****************************************************************************80
%
%% TEST0235 tests BIRTHDAY_CDF, BIRTHDAY_CDF_INV, BIRTHDAY_PDF.
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
  fprintf ( 1, 'TEST0235\n' );
  fprintf ( 1, '  For the Birthday PDF,\n' );
  fprintf ( 1, '  BIRTHDAY_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  BIRTHDAY_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  BIRTHDAY_PDF evaluates the PDF;\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '       N            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for n = 1 : 30

    pdf = birthday_pdf ( n );

    cdf = birthday_cdf ( n );

    n2 = birthday_cdf_inv ( cdf );

    fprintf ( 1, '  %8d  %14f  %14f  %8d\n', n, pdf, cdf, n2 );

  end

  return
end
