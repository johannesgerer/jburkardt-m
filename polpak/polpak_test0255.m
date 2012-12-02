function polpak_test0255 ( )

%*****************************************************************************80
%
%% TEST0255 tests ERROR_F_INVERSE, ERF_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0255:\n' );
  fprintf ( 1, '  ERROR_F_INVERSE inverts the error function.\n' );
  fprintf ( 1, '  ERF_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    FX            X    ERROR_F_INVERSE(FX)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x1, fx ] = erf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    x2 = error_f_inverse ( fx );

    fprintf ( 1, '  %6f  %12f  %12f\n', fx, x1, x2 );

  end

  return
end
