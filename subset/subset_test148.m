function subset_test148 ( )

%*****************************************************************************80
%
%% TEST148 tests THUE_BINARY_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST148\n' );
  fprintf ( 1, '  THUE_BINARY_NEXT returns the next Thue binary sequence.\n' );
  fprintf ( 1, '\n' );

  n = 1;
  thue(1) = 0;
  fprintf ( 1, '  %2d  ', n );
  for i = 1 : n
    fprintf ( 1, '%1d', thue(i) );
  end
  fprintf ( 1, '\n' );

  for i = 1 : 6

    [ n, thue ] = thue_binary_next ( n, thue );

    fprintf ( 1, '  %2d  ', n );
    for i = 1 : n
      fprintf ( 1, '%1d', thue(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
