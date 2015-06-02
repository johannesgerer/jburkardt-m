function binomial_values_test ( )

%*****************************************************************************80
%
%% BINOMIAL_VALUES_TEST demonstrates the use of BINOMIAL_VALUES.
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
  fprintf ( 1, 'BINOMIAL_VALUES_TEST:\n' );
  fprintf ( 1, '  BINOMIAL_VALUES returns values of\n' );
  fprintf ( 1, '  the binomial numbers.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     A     B        C(A,B)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, c ] = binomial_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %4d  %4d  %10d\n', a, b, c );

  end

  return
end
