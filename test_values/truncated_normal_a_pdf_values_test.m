function truncated_normal_a_pdf_values_test ( )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_A_PDF_VALUES_TEST tests TRUNCATED_NORMAL_A_PDF_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 September 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRUNCATED_NORMAL_A_PDF_VALUES_TEST:\n' );
  fprintf ( 1, '  TRUNCATED_NORMAL_A_PDF_VALUES stores values of\n' );
  fprintf ( 1, '  the PDF of the Normal Distribution truncated to [A,+oo).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '            MU         SIGMA             A             X               FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, mu, sigma, a, x, fx ] = ...
      truncated_normal_a_pdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %12f  %12f  %24.16f\n', ...
      mu, sigma, a, x, fx );

  end

  return
end
