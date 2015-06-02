function treepack_test006 ( )

%*****************************************************************************80
%
%% TREEPACK_TEST006 tests CBT_TRAVERSE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 June 2013
%
%  Author:
%
%    John Burkardt
%
  depth = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TREEPACK_TEST006\n' );
  fprintf ( 1, '  CBT_TRAVERSE traverses a complete binary tree.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For this demonstration, we simply print our path.\n' );
  fprintf ( 1, '  The tree depth is %d\n', depth );
  fprintf ( 1, '\n' );

  cbt_traverse ( depth );

  return
end
