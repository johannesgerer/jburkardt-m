function polpak_test044 ( )

%*****************************************************************************80
%
%% TEST044 tests I4_FACTORIAL2, I4_FACTORIAL2_VALUES.
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
  fprintf ( 1, 'TEST044:\n' );
  fprintf ( 1, '  I4_FACTORIAL2 evaluates the double factorial function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N   Exact  I4_FACTORIAL2(N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, fn ] = i4_factorial2_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fn2 = i4_factorial2 ( n );

    fprintf ( 1, '  %2d  %6d  %6d\n', n, fn, fn2 );

  end

  return
end
