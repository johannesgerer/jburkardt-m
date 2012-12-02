function polpak_test06855 ( )

%*****************************************************************************80
%
%% TEST06855 tests R8_GAMMA, GAMMA_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST06855:\n' );
  fprintf ( 1, '  R8_GAMMA evaluates the Gamma function.\n' );
  fprintf ( 1, '  GAMMA_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X       Gamma(X)                  Gamma(X)                DIFF\n' );
  fprintf ( 1, '             (Tabulated)               (R8_GAMMA)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = gamma_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r8_gamma ( x );

    fprintf ( 1, '  %6.2f  %24.16e  %24.16e  %10.4e\n', x, fx, fx2, abs ( fx - fx2 ) );

  end

  return
end
