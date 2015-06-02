function r8_fall_values_test ( )

%*****************************************************************************80
%
%% R8_FALL_VALUES_TEST demonstrates the use of R8_FALL_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 December 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_FALL_VALUES_TEST:\n' );
  fprintf ( 1, '  R8_FALL_VALUES returns some exact values\n' );
  fprintf ( 1, '  of the falling factorial function:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     X     N      R8_FALL(X,N)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, n, f ] = r8_fall_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %8f  %8d  %12g\n', x, n, f );

  end

  return
end
