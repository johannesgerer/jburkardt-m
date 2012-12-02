function prob_test108 ( )

%*****************************************************************************80
%
%% TEST108 tests MAXWELL_CDF, MAXWELL_CDF_INV, MAXWELL_PDF.
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
  fprintf ( 1, 'TEST108\n' );
  fprintf ( 1, '  For the Maxwell CDF:\n' );
  fprintf ( 1, '  MAXWELL_CDF evaluates the CDF.\n' );
  fprintf ( 1, '  MAXWELL_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  MAXWELL_PDF evaluates the PDF.\n' );

  a = 2.0;

  if ( ~maxwell_check ( a ) );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST108 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = maxwell_sample ( a, seed );

    pdf = maxwell_pdf ( x, a );

    cdf = maxwell_cdf ( x, a );

    x2 = maxwell_cdf_inv ( cdf, a );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
