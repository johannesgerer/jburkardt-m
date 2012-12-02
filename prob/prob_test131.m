function prob_test131 ( )

%*****************************************************************************80
%
%% TEST131 tests RAYLEIGH_CDF, RAYLEIGH_CDF_INV, RAYLEIGH_PDF.
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
  fprintf ( 1, 'TEST131\n' );
  fprintf ( 1, '  For the Rayleigh PDF:\n' );
  fprintf ( 1, '  RAYLEIGH_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  RAYLEIGH_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  RAYLEIGH_PDF evaluates the PDF;\n' );

  a = 2.0;

  check = rayleigh_check ( a );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST131 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =             %14f\n', a );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = rayleigh_sample ( a, seed );

    pdf = rayleigh_pdf ( x, a );

    cdf = rayleigh_cdf ( x, a );

    x2 = rayleigh_cdf_inv ( cdf, a );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
