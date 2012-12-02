function subset_test023a ( )

%*****************************************************************************80
%
%% TEST023a tests DERANGE_WEED_NEXT.
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
  fprintf ( 1, 'TEST023a\n' );
  fprintf ( 1, '  DERANGE_WEED_NEXT generates derangements\n' );
  fprintf ( 1, '  by generating ALL permutations, and "weeding out"\n' );
  fprintf ( 1, '  the ones that are not derangements.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here, we seek all derangments of order N = %d\n', n );
  fprintf ( 1, '\n' );

  a = [];
  more = 0;
  number = 0;
 
  while ( 1 )

    [ a, more ] = derange_weed_next ( n, a, more );

    number = number + 1;
    fprintf ( 1, '  %2d', number );
    for i = 1 : n
      fprintf ( 1, '  %2d', a(i) );
    end
    fprintf ( 1, '\n' );

    if ( ~more )
      break
    end
 
  end

  return
end
