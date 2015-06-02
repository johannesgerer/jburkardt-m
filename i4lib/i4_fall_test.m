function i4_fall_test ( )

%*****************************************************************************80
%
%% I4_FALL_TEST tests I4_FALL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 December 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_FALL_TEST\n' );
  fprintf ( 1, '  I4_FALL evaluates the falling factorial function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         M         N      Exact         I4_FALL(M,N)\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, m, n, f1 ] = i4_fall_values ( n_data );

    if ( n_data == 0 )
      break
    end

    f2 = i4_fall ( m, n );

    fprintf ( 1, '  %8d  %8d  %12d  %12d\n', m, n, f1, f2 );

  end
 
  return
end
