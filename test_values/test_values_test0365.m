function test_values_test0365 ( )

%*****************************************************************************80
%
%% TEST0365 demonstrates the use of BESSEL_YX_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 April 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0365:\n' );
  fprintf ( 1, '  BESSEL_YX_VALUES stores values of \n' );
  fprintf ( 1, '  the Bessel Yn function for NONINTEGER order.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N      X            YN(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, x, fx ] = bessel_yx_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %12f  %24.16e\n', n, x, fx );

  end

  return
end
