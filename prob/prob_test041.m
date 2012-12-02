function prob_test041 ( )

%*****************************************************************************80
%
%% TEST041 tests DERANGED_CDF, DERANGED_CDF_INV, DERANGED_PDF;
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
  fprintf ( 1, 'TEST041\n' );
  fprintf ( 1, '  For the Deranged PDF:\n' );
  fprintf ( 1, '  DERANGED_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  DERANGED_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  DERANGED_PDF evaluates the PDF;\n' );

  a = 7;

  check = deranged_check ( a );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST041 - Fatal error!\n' );
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

    [ x, seed ] = deranged_sample ( a, seed );

    pdf = deranged_pdf ( x, a );

    cdf = deranged_cdf ( x, a );

    x2 = deranged_cdf_inv ( cdf, a );

    fprintf ( 1, '  %14d  %14f  %14f  %14d\n', x, pdf, cdf, x2 );

  end

  return
end
