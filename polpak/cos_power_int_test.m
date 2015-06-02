function cos_power_int_test ( )

%*****************************************************************************80
%
%% COS_POWER_INT_TEST tests COS_POWER_INT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COS_POWER_INT_TEST\n' );
  fprintf ( 1, '  COS_POWER_INT returns values of\n' );
  fprintf ( 1, '  the integral of COS(X)^N from A to B.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A         B          N      Exact           Computed\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, n, fx ] = cos_power_int_values ( n_data );

    if ( n_data == 0 )
      break;
    end

    fx2 = cos_power_int ( a, b, n );

    fprintf ( 1, '  %8f  %8f  %6d  %14e  %14e\n', a, b, n, fx, fx2 );

  end

  return
end
