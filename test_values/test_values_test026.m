function test_values_test026 ( )

%*****************************************************************************80
%
%% TEST026 demonstrates the use of BESSEL_JN_VALUES.
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
  fprintf ( 1, 'TEST026:\n' );
  fprintf ( 1, '  BESSEL_JN_VALUES stores values of\n' );
  fprintf ( 1, '  the Bessel Jn function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N      X            JN(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = bessel_jn_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '%6d  %12f  %24.16f\n', n, x, fx );

  end

  return
end
