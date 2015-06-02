function hypergeometric_pdf_values_test ( )

%*****************************************************************************80
%
%% HYPERGEOMETRIC_PDF_VALUES_TEST demonstrates the use of HYPERGEOMETRIC_PDF_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPERGEOMETRIC_PDF_VALUES_TEST:\n' );
  fprintf ( 1, '  HYPERGEOMETRIC_PDF_VALUES stores values of \n' );
  fprintf ( 1, '  the Hypergeometric Probability Density Function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Sam    Suc    Pop    X     FX\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, sam, suc, pop, x, fx ] = hypergeometric_pdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %6d  %6d  %6d  %6d  %24.16f\n', sam, suc, pop, x, fx );

  end

  return
end
