function subset_test073 ( )

%*****************************************************************************80
%
%% TEST073 tests KSUB_NEXT3.
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
  k = 3;
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST073\n' );
  fprintf ( 1, '  KSUB_NEXT3 generates all K subsets of an N set\n' );
  fprintf ( 1, '  using the revolving door method.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Rank    Subset  Added Removed\n' );
  fprintf ( 1, '\n' );

  rank = 0;
  a = [];
  more = 0;
 
  while ( 1 )

    [ a, more, in, out ] = ksub_next3 ( n, k, a, more);

    rank = rank + 1;
    fprintf ( 1, '  %2d', rank );
    for i = 1 : k
      fprintf ( 1, '  %2d', a(i) );
    end
    fprintf ( 1, '     %2d  %2d\n', in, out );

    if ( ~more )
      break
    end

  end

  return
end
