function test009 ( )

%*****************************************************************************80
%
%% TEST009 tests BERNOULLI_CDF, BERNOULLI_CDF_INV, BERNOULLI_PDF.
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
  fprintf ( 1, 'TEST009\n' );
  fprintf ( 1, '  For the Bernoulli PDF,\n' );
  fprintf ( 1, '  BERNOULLI_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  BERNOULLI_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  BERNOULLI_PDF evaluates the PDF;\n' );

  a = 0.75;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );

  check = bernoulli_check ( a );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST009 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = bernoulli_sample ( a, seed );

    pdf = bernoulli_pdf ( x, a );

    cdf = bernoulli_cdf ( x, a );

    x2 = bernoulli_cdf_inv ( cdf, a );

    fprintf ( 1, '  %14d  %14f  %14f  %14d\n', x, pdf, cdf, x2 );

  end

  return
end
