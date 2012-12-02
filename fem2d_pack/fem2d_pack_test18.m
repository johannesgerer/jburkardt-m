function fem2d_pack_test18 ( )

%*****************************************************************************80
%
%% TEST18 tests SHAPE_TEST.
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
  fprintf ( 1, 'TEST18\n' );
  fprintf ( 1, '  SHAPE_TEST tests the shape routines.\n' );

  shape_test ( 'Q4' );

  shape_test ( 'Q8' );

  shape_test ( 'Q9' );

  shape_test ( 'Q12' );

  shape_test ( 'Q16' );

  shape_test ( 'QL' );

  shape_test ( 'T3' );

  shape_test ( 'T4' );

  shape_test ( 'T6' );

  shape_test ( 'T10' );

  return
end
