function subset_test059 ( )

%*****************************************************************************80
%
%% TEST059 tests I4_PARTITION_NEXT.
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
  n = 7;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST059\n' );
  fprintf ( 1, '  I4_PARTITION_NEXT generates partitions of an integer.\n' );
  fprintf ( 1, '  Here N = %d\n', n );
  fprintf ( 1, '\n' );

  rank = 0;
  done = 1;
  npart = 0;
  a = [];
  mult = [];
  
  while ( 1 )

    [ npart, a, mult, done ] = i4_partition_next ( n, npart, a, mult, done );
 
    if ( done )
      break 
    end

    rank = rank + 1;

    i4_partition_print ( n, npart, a, mult );

  end

  return
end
