function subset_test058 ( )

%*****************************************************************************80
%
%% TEST058 tests I4_PARTITION_CONJ.
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
  n = 14;
  npart1 = 4;

  a1(1:npart1) = [ 2, 5, 1, 4 ];
  mult1(1:npart1) = [ 1, 1, 3, 1 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST058\n' );
  fprintf ( 1, '  I4_PARTITION_CONJ conjugates an integer partition.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Original partition:\n' );
  fprintf ( 1, '\n' );

  i4_partition_print ( n, npart1, a1, mult1 );

  [ a2, mult2, npart2 ] = i4_partition_conj ( n, a1, mult1, npart1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Conjugate partition:\n' );
  fprintf ( 1, '\n' );

  i4_partition_print ( n, npart2, a2, mult2 );

  return
end
