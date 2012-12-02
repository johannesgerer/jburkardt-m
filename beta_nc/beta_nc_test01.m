function beta_nc_test01 ( )

%*****************************************************************************80
%
%% BETA_NC_TEST01 tests BETA_NONCENTRAL_CDF against tabulated values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2008
%
%  Author:
%
%    John Burkardt
%
  error_max = 1.0E-10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BETA_NC_TEST01:\n' );
  fprintf ( 1, '  Compare tabulated values of the noncentral\n' );
  fprintf ( 1, '  incomplete Beta Function against values\n' );
  fprintf ( 1, '  computed by BETA_NONCENTRAL_CDF.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1,'        A        B   LAMBDA      X      ' );
  fprintf ( 1,'  CDF                       CDF                     DIFF\n' );
  fprintf ( 1,'                                        ' );
  fprintf ( 1,' (tabulated)               (BETA_NC)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, lambda, x, fx ] = beta_noncentral_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = beta_noncentral_cdf ( a, b, lambda, x, error_max );

    fprintf ( 1, '  %7.1f  %7.1f  %7.1f  %7.3f  %24.16e  %24.16e  %10.4e\n', ...
    a, b, lambda, x, fx, fx2, abs ( fx - fx2 ) );

  end

  return
end
