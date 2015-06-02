function r8_rise_test ( )

%*****************************************************************************80
%
%% R8_RISE_TEST tests R8_RISE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 December 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_RISE_TEST\n' );
  fprintf ( 1, '  R8_RISE evaluates the rising factorial Rise(X,N).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X        N                     Exact' );
  fprintf ( 1, '                  Computed\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, n, f1 ] = r8_rise_values ( n_data );

    if ( n_data == 0 )
      break
    end

    f2 = r8_rise ( x, n );

    fprintf ( 1, '  %8.4f  %4d  %24.16g  %24.16g\n', x, n, f1, f2 );

  end
 
  return
end
