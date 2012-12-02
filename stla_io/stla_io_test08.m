function test08 ( input_file_name )

%*****************************************************************************80
%
%% TEST08 tests STLA_READ and STLA_READ_FAST.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  Compare two routines with the same functionality.\n' );
  fprintf ( 1, '  One is designed to run faster than the other,\n' );
  fprintf ( 1, '  especially on large problems with thousands of faces.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  STLA_READ reads various data from an ASCII STL file.\n' );
  fprintf ( 1, '  STLA_READ_FAST reads data from an ASCII STL file.\n' );
  fprintf ( 1, '\n' );

  [ solid_num, node_num, face_num, text_num ] = stla_size_fast ( ...
    input_file_name );

  t1 = clock;

  [ node_xyz, face_node, face_normal ] = stla_read_fast ( ...
    input_file_name, node_num, face_num );

  t2 = clock;

  diff1 = etime ( t2, t1 );

  fprintf ( 1, '  STLA_READ_FAST read the file in %f seconds.\n', diff1 );

  [ solid_num, node_num, face_num, text_num ] = stla_size ( ...
    input_file_name );

  t3 = clock;

  [ node_xyz, face_node, face_normal ] = stla_read ( ...
    input_file_name, node_num, face_num );

  t4 = clock;

  diff2 = etime ( t4, t3 );

  fprintf ( 1, '  STLA_READ      read the file in %f seconds.\n', diff2 );

  stla_size_print ( input_file_name, solid_num, node_num, face_num, ...
    text_num );

  return
end
