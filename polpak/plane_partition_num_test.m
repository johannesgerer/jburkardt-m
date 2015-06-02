function plane_partition_num_test ( )

%*****************************************************************************80
%
%% PLANE_PARTITION_NUM_TEST tests PLANE_PARTITION_NUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PLANE_PARTITION_NUM_TEST\n' );
  fprintf ( 1, '  PLANE_PARTITION_NUM counts the number of plane\n' );
  fprintf ( 1, '  partitions of an integer.\n' );
  fprintf ( 1, '\n' );
 
  for n = 1 : 10
    p = plane_partition_num ( n );
    fprintf ( 1, '  %2d  %6d\n', n, p );
  end
 
  return
end
