function r8_gamma_test ( )

%*****************************************************************************80
%
%% R8_GAMMA_TEST demonstrates the use of R8_GAMMA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_GAMMA_TEST:\n' );
  fprintf ( 1, '  R8_GAMMA evaluates the Gamma function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X            GAMMA(X)      R8_GAMMA(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = gamma_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = r8_gamma ( x );

    fprintf ( 1, '  %12g  %24.16g  %24.16g\n', x, fx1, fx2 );

  end

  return
end
