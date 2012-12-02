function combo_test25 ( )

%*****************************************************************************80
%
%% COMBO_TEST25 tests PARTITION_GREEDY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2011
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST25\n' );
  fprintf ( 1, '  PARTITION_GREEDY partitions an integer vector into\n' );
  fprintf ( 1, '  two subsets with nearly equal sum.\n' );

  a = [ 2, 10, 3, 8, 5, 7, 9, 5, 3, 2 ]';

  [ a, indx ] = partition_greedy ( n, a );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  Data set #1 partitioned:\n' );
  fprintf ( 1, ' \n' );

  sums(1:2) = 0;

  for i = 1 : n

    if ( indx(i) == 1 )
      sums(1) = sums(1) + a(i);
      fprintf ( 1, '  %4d\n', a(i) );
    else
      fprintf ( 1, '        %4d\n', a(i) );
      sums(2) = sums(2) + a(i);
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sums:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %4d  %4d\n', sums(1:2) );

  a = [ 771, 121, 281, 854, 885, 734, 486, 1003, 83, 62 ]';

  [ a, indx ] = partition_greedy ( n, a );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  Data set #2 partitioned:\n' );
  fprintf ( 1, ' \n' );

  sums(1:2) = 0;

  for i = 1 : n

    if ( indx(i) == 1 )
      sums(1) = sums(1) + a(i);
      fprintf ( 1, '  %4d\n', a(i) );
    else
      fprintf ( 1, '        %4d\n', a(i) );
      sums(2) = sums(2) + a(i);
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sums:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %4d  %4d\n', sums(1:2) );

  return
end
