function fem2d_pack_test13 ( )

%*****************************************************************************80
%
%% TEST13 tests MAP_TEST.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST13\n' );
  fprintf ( 1, '  Test the map routines.\n' );

  map_test ( 'Q4' );

  map_test ( 'Q8' );

  map_test ( 'Q9' );

  map_test ( 'Q12' );

  map_test ( 'Q16' );

  map_test ( 'QL' );

  map_test ( 'T3' );

  map_test ( 'T6' );

  map_test ( 'T10' );

  return
end
