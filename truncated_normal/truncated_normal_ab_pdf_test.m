function truncated_normal_ab_pdf_test ( )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_AB_PDF_TEST tests TRUNCATED_NORMAL_AB_PDF;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRUNCATED_NORMAL_AB_PDF_TEST\n' );
  fprintf ( 1, '  TRUNCATED_NORMAL_AB_PDF evaluates the Truncated Normal PDF.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The "parent" normal distribution has\n' );
  fprintf ( 1, '    mean = mu\n' );
  fprintf ( 1, '    standard deviation = sigma\n' );
  fprintf ( 1, '  The parent distribution is truncated to\n' );
  fprintf ( 1, '  the interval [a,b]\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '                                                           Stored         Computed\n' );
  fprintf ( 1, '       X        Mu         S         A         B             PDF             PDF\n' );
  fprintf ( 1, '\n');

  n_data = 0;

  while ( 1 )

    [ n_data, mu, sigma, a, b, x, pdf1 ] ...
      = truncated_normal_ab_pdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    pdf2 = truncated_normal_ab_pdf ( x, mu, sigma, a, b );

    fprintf( 1, '  %8.1f  %8.1f  %8.1f  %8.1f  %8.1f  %14g  %14g\n', x, mu, sigma, a, b, pdf1, pdf2 );

  end

  return
end
