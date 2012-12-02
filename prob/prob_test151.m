function prob_test151 ( )

%*****************************************************************************80
%
%% TEST151 tests UNIFORM_DISCRETE_CDF, UNIFORM_DISCRETE_CDF_INV, UNIFORM_DISCRETE_PDF;
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
  fprintf ( 1, 'TEST151\n' );
  fprintf ( 1, '  For the Uniform Discrete PDF:\n' );
  fprintf ( 1, '  UNIFORM_DISCRETE_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  UNIFORM_DISCRETE_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  UNIFORM_DISCRETE_PDF evaluates the PDF;\n' );

  a = 1;
  b = 6;

  check = uniform_discrete_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST151 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %6d\n', a );
  fprintf ( 1, '  PDF parameter B =             %6d\n', b );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = uniform_discrete_sample ( a, b, seed );

    pdf = uniform_discrete_pdf ( x, a, b );

    cdf = uniform_discrete_cdf ( x, a, b );

    x2 = uniform_discrete_cdf_inv ( cdf, a, b );

    fprintf ( 1, '  %14d  %14f  %14f  %14d\n', x, pdf, cdf, x2 );

  end

  return
end
