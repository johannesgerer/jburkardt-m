function chi_values_test ( )

%*****************************************************************************80
%
%% CHI_VALUES_TEST demonstrates the use of CHI_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHI_VALUES_TEST:\n' );
  fprintf ( 1, '  CHI_VALUES stores values of\n' );
  fprintf ( 1, '  the hyperbolic Cosine Integral function CHI(X).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X            CHI(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = chi_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
