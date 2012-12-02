function test_values_test066 ( )

%*****************************************************************************80
%
%% TEST066 demonstrates the use of ERF_VALUES.
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
  fprintf ( 1, 'TEST066:\n' );
  fprintf ( 1, '  ERF_VALUES stores values of\n' );
  fprintf ( 1, '  the error function ERF(X).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X          ERF(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = erf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
