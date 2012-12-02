function test_values_test036 ( )

%*****************************************************************************80
%
%% TEST36 demonstrates the use of BESSEL_YN_VALUES.
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
  fprintf ( 1, 'TEST36:\n' );
  fprintf ( 1, '  BESSEL_YN_VALUES stores values of\n' );
  fprintf ( 1, '  the Bessel Yn function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N      X            YN(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = bessel_yn_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %6d  %12f  %24.16e\n', n, x, fx );

  end

  return
end
