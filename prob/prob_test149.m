function prob_test149 ( )

%*****************************************************************************80
%
%% TEST149 tests UNIFORM_CDF, UNIFORM_CDF_INV, UNIFORM_PDF;
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
  fprintf ( 1, 'TEST149\n' );
  fprintf ( 1, '  For the Uniform PDF:\n' );
  fprintf ( 1, '  UNIFORM_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  UNIFORM_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  UNIFORM_PDF evaluates the PDF;\n' );

  a = 1.0;
  b = 10.0;

  check = uniform_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST149 - Fatal error!\n' );
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

    [ x, seed ] = uniform_sample ( a, b, seed );

    pdf = uniform_pdf ( x, a, b );

    cdf = uniform_cdf ( x, a, b );

    x2 = uniform_cdf_inv ( cdf, a, b );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end
