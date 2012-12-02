function geometry_test042 ( )

%*****************************************************************************80
%
%% TEST042 tests SEGMENTS_DIST_2D.
%
%  Discussion:
%
%    Case 1, parallel, not coincident.
%    Case 2, parallel, coincident, overlapping.
%    Case 3, parallel, coincident, disjoint.
%    Case 4, nonparallel, intersecting.
%    Case 5, nonparallel, disjoint.
%    Case 6 and 7, should be same, because simply a translation by 50;
%    Case 8 and 9, answers should be same.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
  test_num = 9;

  p1_test = [ ...
    2.0,   3.0; ...
    2.0,   3.0; ...
    2.0,   3.0; ...
    2.0,   3.0; ...
    2.0,   3.0; ...
   57.0,  53.0; ...
    7.0,   3.0; ...
    0.0,   0.0; ...
  -10.0, -10.0 ]';
  p2_test = [ ...
    8.0,   6.0; ...
    8.0,   6.0; ...
    8.0,   6.0; ...
    8.0,   6.0; ...
    8.0,   6.0; ...
   58.0,  53.0; ...
    8.0,   3.0; ...
  100.0, 100.0; ...
  100.0, 100.0 ]';
  q1_test = [ ...
    8.0,  3.0; ...
    4.0,  4.0; ...
   14.0,  9.0; ...
    0.0,  8.0; ...
    7.0,  3.0; ...
   65.0, 45.0; ...
   15.0, -5.0; ...
   50.0,  0.0; ...
   50.0,  0.0 ]';
  q2_test = [ ...
   14.0,  6.0; ...
   14.0,  9.0; ...
   16.0, 10.0; ...
    5.0,  3.0; ...
    9.0, -1.0; ...
   57.0, 53.0; ...
    7.0,  3.0; ...
   60.0,  0.0; ...
   60.0,  0.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST042\n' );
  fprintf ( 1, '  SEGMENTS_DIST_2D computes the distance between\n' );
  fprintf ( 1, '    line segments in 2D.\n' );

  for test = 1 : test_num

    p1(1:2,1) = p1_test(1:2,test);
    p2(1:2,1) = p2_test(1:2,test);
    q1(1:2,1) = q1_test(1:2,test);
    q2(1:2,1) = q2_test(1:2,test);

    dist = segments_dist_2d ( p1, p2, q1, q2 );

    if ( test == 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Same slope, different intercepts.\n' );
    elseif ( test == 2 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Same slope, same intercepts, overlapping.\n' );
      fprintf ( 1, '  Distance should be 0.\n' );
    elseif ( test == 3 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Same slope, same intercepts, disjoint.\n' );
      fprintf ( 1, '  Distance should be sqrt(45)=6.7082038\n' );
    elseif ( test == 4 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Different slopes, intersecting.\n' );
      fprintf ( 1, '  Distance should be 0.\n' );
    elseif ( test == 5 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Different slopes, not intersecting.\n' );
    elseif ( test == 6 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Simple problem.\n' );
      fprintf ( 1, '  Distance should be 0\n' );
    elseif ( test == 7 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Same data, translated by 50.\n' );
      fprintf ( 1, '  Distance should be 0\n' );
    elseif ( test == 8 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Diagonal and horizontal.\n' );
      fprintf ( 1, '  Distance should be sqrt(2500/2)=35.355339\n' );
    elseif ( test == 9 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Same data, except first segment extended.\n' );
      fprintf ( 1, '  Distance should be sqrt(2500/2)=35.355339\n' );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  P1 = %8f  %8f\n', p1(1:2,1) );
    fprintf ( 1, '  P2 = %8f  %8f\n', p2(1:2,1) );
    fprintf ( 1, '  Q1 = %8f  %8f\n', q1(1:2,1) );
    fprintf ( 1, '  Q2 = %8f  %8f\n', q2(1:2,1) );
    fprintf ( 1, '  Distance([P1,P2],[Q1,Q2]) = %f\n', dist );

  end

  return
end
