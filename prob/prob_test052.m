function prob_test052 ( )

%*****************************************************************************80
%
%% TEST052 tests DISCRETE_CDF, DISCRETE_CDF_INV, DISCRETE_PDF.
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
  a = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST052\n' );
  fprintf ( 1, '  For the Discrete PDF:\n' );
  fprintf ( 1, '  DISCRETE_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  DISCRETE_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  DISCRETE_PDF evaluates the PDF;\n' );

  b(1:6) = [ 1.0, 2.0, 6.0, 2.0, 4.0, 1.0 ];

  check = discrete_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST052 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %6d\n', a );
  fprintf ( 1, '  PDF parameters B:\n' );
  for j = 1 : a
    fprintf ( 1, '  %6d  %14f\n', j, b(j) );
  end

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = discrete_sample ( a, b, seed );

    pdf = discrete_pdf ( x, a, b );

    cdf = discrete_cdf ( x, a, b );

    x2 = discrete_cdf_inv ( cdf, a, b );

    fprintf ( 1, '  %14d  %14f  %14f  %14d\n', x, pdf, cdf, x2 );

  end

  return
end
