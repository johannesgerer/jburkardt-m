function i4_factorial_test ( )

%*****************************************************************************80
%
%% I4_FACTORIAL_TEST tests I4_FACTORIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_FACTORIAL_TEST:\n' );
  fprintf ( 1, '  I4_FACTORIAL evaluates the factorial function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     X       Exact F       I4_FACTORIAL(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, fn ] = i4_factorial_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fn2 = i4_factorial ( n );

    fprintf ( 1, '  %2d  %10d  %10d\n', n, fn, fn2 );

  end

  return
end
