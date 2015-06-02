function r8_factorial_test ( )

%*****************************************************************************80
%
%% R8_FACTORIAL_TEST tests R8_FACTORIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 December 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_FACTORIAL_TEST\n' );
  fprintf ( 1, '  R8_FACTORIAL evaluates the factorial function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      N                     Exact' );
  fprintf ( 1, '                  Computed\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, f1 ] = r8_factorial_values ( n_data );

    if ( n_data == 0 )
      break
    end

    f2 = r8_factorial ( n );

    fprintf ( 1, '  %4d  %24.16g  %24.16g\n', n, f1, f2 );

  end
 
  return
end
