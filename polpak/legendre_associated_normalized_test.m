function legendre_associated_normalized_test ( )

%*****************************************************************************80
%
%% LEGENDRE_ASSOCIATED_NORMALIZED_TEST tests LEGENDRE_ASSOCIATED_NORMALIZED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 February 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEGENDRE_ASSOCIATED_NORMALIZED_TEST:\n' );
  fprintf ( 1, '  LEGENDRE_ASSOCIATED_NORMALIZED evaluates the\n' );
  fprintf ( 1, '  associated Legrendre functions, using a\n' );
  fprintf ( 1, '  normalization appropriate for spherical harmonics.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      N       M    X     Exact F     PNM(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, m, x, fx ] = ...
      legendre_associated_normalized_sphere_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = legendre_associated_normalized ( n, m, x );

    fprintf ( 1, '  %6d  %6d  %6f  %12f  %12f\n', n, m, x, fx, fx2(n+1) );

  end

  return
end
