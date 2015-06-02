function ci_values_test ( )

%*****************************************************************************80
%
%% CI_VALUES_TEST demonstrates the use of CI_VALUES.
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
  fprintf ( 1, 'CI_VALUES_TEST:\n' );
  fprintf ( 1, '  CI_VALUES stores values of\n' );
  fprintf ( 1, '  the Cosine Integral function CI(X).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X            CI(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = ci_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
