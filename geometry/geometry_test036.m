function geometry_test036 ( )

%*****************************************************************************80
%
%% TEST036 tests SEGMENT_CONTAINS_POINT_1D.
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
  ntest = 4;

  ptest =  [ 3.0,   7.5, 20.0,  5.0 ];
  p1test = [ 2.0,  10.0,  8.0, 88.0 ];
  p2test = [ 6.0, -10.0, 10.0, 88.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST036\n' );
  fprintf ( 1, '  SEGMENT_CONTAINS_POINT_1D determines if a point\n' );
  fprintf ( 1, '    lies within a line segment in 1D.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       P1     P       T\n' );
  fprintf ( 1, '\n' );

  for itest = 1 : ntest

    p1 = p1test(itest);
    p2 = p2test(itest);
    p = ptest(itest);

    t = segment_contains_point_1d ( p1, p2, p );
    fprintf ( 1, '  %10f  %10f  %10f  %12f\n', p1, p2, p, t );

  end

  return
end
