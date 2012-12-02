function subset_test022a ( )

%*****************************************************************************80
%
%% TEST022a tests DERANGE_BACK_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 5;
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST022a\n' );
  fprintf ( 1, '  DERANGE_BACK_NEXT generates derangements\n' );
  fprintf ( 1, '  using backtracking.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here, we seek all derangments of order N = %d\n', n );
  fprintf ( 1, '\n' );

  a = [];
  more = 0;
  number = 0;

  while ( 1 )

    [ a, more ] = derange_back_next ( n, a, more );

    if ( ~more )
      break
    end

    number = number + 1;
    fprintf ( 1, '  %2d', number );
    for i = 1 : n
      fprintf ( 1, '  %2d', a(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
