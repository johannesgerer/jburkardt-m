function stroud_test48 ( )

%*****************************************************************************80
%
%% TEST48 tests TVEC_EVEN, TVEC_EVEN2, TVEC_EVEN3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST48\n' );
  fprintf ( 1, '  For evenly spaced angles between 0 and 2*PI:\n' );
  fprintf ( 1, '  TVEC_EVEN\n' );
  fprintf ( 1, '  TVEC_EVEN2\n' );
  fprintf ( 1, '  TVEC_EVEN3\n' );

  nt = 4;

  t = tvec_even ( nt );

  r8vec_print ( nt, t, '  TVEC_EVEN' );

  nt = 4;

  t = tvec_even2 ( nt );

  r8vec_print ( nt, t, '  TVEC_EVEN2' );

  nt = 4;

  t = tvec_even3 ( nt );

  r8vec_print ( nt, t, '  TVEC_EVEN3' );

  return
end
