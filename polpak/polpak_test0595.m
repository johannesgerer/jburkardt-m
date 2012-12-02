function polpak_test0595 ( )

%*****************************************************************************80
%
%% TEST0595 tests LEGENDRE_ASSOCIATED_NORMALIZED,  LEGENDRE_ASSOCIATED_NORMALIZED_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 September 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0595:\n' );
  fprintf ( 1, '  LEGENDRE_ASSOCIATED_NORMALIZED evaluates the\n' );
  fprintf ( 1, '  associated Legrendre functions, using a\n' );
  fprintf ( 1, '  normalization appropriate for spherical harmonics.\n' );
  fprintf ( 1, '  LEGENDRE_ASSOCIATED_NORMALIZED_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      N       M    X     Exact F     PNM(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, m, x, fx ] = legendre_associated_normalized_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = legendre_associated_normalized ( n, m, x );

    fprintf ( 1, '  %6d  %6d  %6f  %12f  %12f\n', n, m, x, fx, fx2(n+1) );

  end

  return
end
