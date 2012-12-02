function subset_test072 ( )

%*****************************************************************************80
%
%% TEST072 tests KSUB_NEXT2.
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
  fprintf ( 1, 'TEST072\n' );
  fprintf ( 1, '  KSUB_NEXT2 generates the next K subset of an\n' );
  fprintf ( 1, '  N set by the revolving door method.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Rank  Subset  Added  Removed\n' );
  fprintf ( 1, '\n' );
%
%  KSUB_NEXT2 doesn't have a good way of stopping.  
%  We will save the starting subset, and stop when the
%  new subset is the same as the starting one.
%
  in = 0;
  out = 0;
  rank = 0;
 
  a = i4vec_indicator ( k );
 
  while ( 1 )
 
    rank = rank + 1;
    fprintf ( 1, '  %2d  ', rank );
    for i = 1 : k
      fprintf ( 1, '  %2d', a(i) );
    end
    fprintf ( 1, '    %2d', in );
    fprintf ( 1, '  %2d\n', out );
 
    [ a, in, out ] = ksub_next2 ( n, k, a );
 
    more = 0;

    for i = 1 : k
      if ( a(i) ~= i )
        more = 1;
      end
    end

    if ( ~more )
      break
    end

  end
 
  return
end
