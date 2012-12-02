function subset_test06225 ( )

%*****************************************************************************80
%
%% SUBSET_TEST06225 tests I4_PARTITIONS_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 August 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUBSET_TEST06225\n' );
  fprintf ( 1, '  I4_PARTITIONS_NEXT produces the next\n' );
  fprintf ( 1, '  nondecreasing partitions of an integer, and\n' );
  fprintf ( 1, '  if necessary, increments the integer to keep on going.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   I Sum    Partition\n' );
  fprintf ( 1, '\n' );
  i = 0;
  s = 3;
  m = [ 0, 0, 0 ]';

  fprintf ( 1, '  %2d  %2d  ', i, sum ( m ) );
  for j = 1 : s
    fprintf ( 1, '  %2d', m(j) );
  end
  fprintf ( 1, '\n' );

  for i = 1 : 15

    m = i4_partitions_next ( s, m );

    fprintf ( 1, '  %2d  %2d  ', i, sum ( m ) );
    for j = 1 : s
      fprintf ( 1, '  %2d', m(j) );
    end
    fprintf ( 1, '\n' );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  You can start from any legal partition.\n' );
  fprintf ( 1, '  Here, we restart at ( 2, 1, 0 ).\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   I Sum    Partition\n' );
  fprintf ( 1, '\n' );
  i = 0;
  s = 3;
  m = [ 2, 1, 0 ]';

  fprintf ( 1, '  %2d  %2d  ', i, sum ( m ) );
  for j = 1 : s
    fprintf ( 1, '  %2d', m(j) );
  end
  fprintf ( 1, '\n' );

  for i = 1 : 15

    m = i4_partitions_next ( s, m );

    fprintf ( 1, '  %2d  %2d  ', i, sum ( m ) );
    for j = 1 : s
      fprintf ( 1, '  %2d', m(j) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
