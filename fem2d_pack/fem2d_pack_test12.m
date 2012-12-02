function fem2d_pack_test12 ( )

%*****************************************************************************80
%
%% TEST12 tests INTERP_TEST.
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
  fprintf ( 1, 'TEST12\n' );
  fprintf ( 1, '  INTERP_TEST tests the interpolating power\n' );
  fprintf ( 1, '  of the element.\n' );

  interp_test ( 'Q4' );

  interp_test ( 'Q8' );

  interp_test ( 'Q9' );

  interp_test ( 'Q12' );

  interp_test ( 'Q16' );

  interp_test ( 'QL' );

  interp_test ( 'T3' );

  interp_test ( 'T4' );

  interp_test ( 'T6' );

  interp_test ( 'T10' );

  return
end
