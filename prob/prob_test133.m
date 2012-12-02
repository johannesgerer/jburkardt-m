function prob_test133 ( )

%*****************************************************************************80
%
%% TEST133 tests RECIPROCAL_CDF, RECIPROCAL_CDF_INV, RECIPROCAL_CDF;
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
  fprintf ( 1, 'TEST133\n' );
  fprintf ( 1, '  For the Reciprocal PDF:\n' );
  fprintf ( 1, '  RECIPROCAL_CDF evaluates the CDF.\n' );
  fprintf ( 1, '  RECIPROCAL_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  RECIPROCAL_PDF evaluates the PDF.\n' );

  a = 1.0;
  b = 3.0;

  check = reciprocal_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST133 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A =         %14f\n', a );
  fprintf ( 1, '  PDF parameter B =         %14f\n', b );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = reciprocal_sample ( a, b, seed );

    pdf = reciprocal_pdf ( x, a, b );

    cdf = reciprocal_cdf ( x, a, b );

    x2 = reciprocal_cdf_inv ( cdf, a, b );

    fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

  end

  return
end
