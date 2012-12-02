function i4lib_test69 ( )

%*****************************************************************************80
%
%% TEST69 tests I4VEC_PART.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST69\n' );
  fprintf ( 1, '  I4VEC_PART partitions an integer.\n' );

  nval = 17;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  NVAL = %d\n', nval );

  a = i4vec_part ( n, nval );

  i4vec_print ( n, a, '  Partitioned:' )

  nval = -49;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  NVAL = %d\n', nval );

  a = i4vec_part ( n, nval );

  i4vec_print ( n, a, '  Partitioned:' );

  return
end
