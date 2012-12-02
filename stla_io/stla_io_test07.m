function test07 ( input_file_name )

%*****************************************************************************80
%
%% TEST07 tests STLA_SIZE and STLA_SIZE_FAST.
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
%     John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  Compare two routines with the same functionality.\n' );
  fprintf ( 1, '  One is designed to run faster than the other,\n' );
  fprintf ( 1, '  especially on large problems with thousands of faces.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  STLA_SIZE determines the size of various objects\n' );
  fprintf ( 1, '    in an ASCII STL file.\n' );
  fprintf ( 1, '  STLA_SIZE_FAST determines the size of various objects\n' );
  fprintf ( 1, '    in an ASCII STL file.\n' );
  fprintf ( 1, '\n' );

  t1 = clock;

  [ solid_num, node_num, face_num, line_num ] = stla_size_fast ( input_file_name );

  t2 = clock;

  diff1 = etime ( t2, t1 );
  
  fprintf ( 1, '  STLA_SIZE_FAST scanned the file in %f seconds.\n', diff1 );

  t3 = clock;

  [ solid_num, node_num, face_num, line_num ] = stla_size ( input_file_name );

  t4 = clock;

  diff2 = etime ( t4, t3 );

  fprintf ( 1, '  STLA_SIZE      scanned the file in %f seconds.\n', diff2 );

  stla_size_print ( input_file_name, solid_num, node_num, face_num, line_num );

  return
end
