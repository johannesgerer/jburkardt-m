function i4_factorial2_test ( )

%*****************************************************************************80
%
%% I4_FACTORIAL2_TEST tests I4_FACTORIAL2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_FACTORIAL2_TEST\n' );
  fprintf ( 1, '  I4_FACTORIAL2 evaluates the double factorial function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         N      Exact         I4_FACTORIAL2(N)\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, n, f1 ] = i4_factorial2_values ( n_data );

    if ( n_data == 0 )
      break
    end

    f2 = i4_factorial2 ( n );

    fprintf ( 1, '  %8d  %12d  %12d\n', n, f1, f2 );

  end
 
  return
end
