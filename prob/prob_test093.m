function prob_test093 ( )

%*****************************************************************************80
%
%% TEST093 tests INVERSE_GAUSSIAN_CDF, INVERSE_GAUSSIAN_PDF.
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
  fprintf ( 1, 'TEST093\n' );
  fprintf ( 1, '  For the Inverse Gaussian PDF:\n' );
  fprintf ( 1, '  INVERSE_GAUSSIAN_CDF evaluates the CDF.\n' );
  fprintf ( 1, '  INVERSE_GAUSSIAN_PDF evaluates the PDF.\n' );

  a = 5.0;
  b = 2.0;

  if ( ~inverse_gaussian_check ( a, b ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST093 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '  PDF parameter B = %14f\n', b );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = inverse_gaussian_sample ( a, b, seed );

    pdf = inverse_gaussian_pdf ( x, a, b );

    cdf = inverse_gaussian_cdf ( x, a, b );

    fprintf ( 1, ' %14f  %14f  %14f\n', x, pdf, cdf );

  end

  return
end
