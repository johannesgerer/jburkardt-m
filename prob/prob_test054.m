function prob_test054 ( )

%*****************************************************************************80
%
%% TEST054 tests EMPIRICAL_DISCRETE_CDF, EMPIRICAL_DISCRETE_CDF_INV, EMPIRICAL_DISCRETE_PDF;
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

  b(1:a) = [ 1.0, 1.0, 3.0, 2.0, 1.0, 2.0 ];
  c(1:a) = [ 0.0, 1.0, 2.0, 4.5, 6.0, 10.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST054\n' );
  fprintf ( 1, '  For the Empirical Discrete PDF:\n' );
  fprintf ( 1, '  EMPIRICAL_DISCRETE_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  EMPIRICAL_DISCRETE_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  EMPIRICAL_DISCRETE_PDF evaluates the PDF;\n' );

  check = empirical_discrete_check ( a, b, c );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST054 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %6d\n', a );
  r8vec_print ( a, b, '  PDF parameter B:' );
  r8vec_print ( a, c, '  PDF parameter C:' );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = empirical_discrete_sample ( a, b, c, seed );

    pdf = empirical_discrete_pdf ( x, a, b, c );

    cdf = empirical_discrete_cdf ( x, a, b, c );

    x2 = empirical_discrete_cdf_inv ( cdf, a, b, c );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
