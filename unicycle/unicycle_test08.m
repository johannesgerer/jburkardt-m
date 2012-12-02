function test08 ( )

%*****************************************************************************80
%
%% TEST08 tests UNICYCLE_INDEX, UNICYCLE_INDEX_TO_SEQUENCE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 June 2012
%
%  Author:
%
%    John Burkardt
%
  n = 6;
  test_num = 5;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  UNICYCLE_INDEX converts a unicycle to index form.\n' );
  fprintf ( 1, '  UNICYCLE_INDEX_TO_SEQUENCE converts an index to unicycle form.\n' );

  for test = 1 : test_num 

    [ u, seed ] = unicycle_random ( n, seed );

    unicycle_print ( n, u, '  The unicycle:' );

    u_index = unicycle_index ( n, u );
    
    unicycle_index_print ( n, u_index, '  The index form:' );

    u2 = unicycle_index_to_sequence ( n, u_index );

    unicycle_print ( n, u2, '  The unicycle recovered:' );

  end

  return
end
