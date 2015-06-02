function triangle_random_centralize_test ( )

%*****************************************************************************80
%
%% TRIANGLE_RANDOM_CENTRALIZE_TEST tests TRIANGLE_RANDOM_CENTRALIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_RANDOM_CENTRALIZE_TEST\n' );
  fprintf ( 1, '  Take N random samples of triangle boundary and average.\n' );
  fprintf ( 1, '  Compare result to area and boundary centroids.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   M       N         Area Centroid   Boundary Centroid\n' );
  fprintf ( 1, '                     Difference      Difference\n' );
  fprintf ( 1, '\n' );
  m = 2;
  n = 1;
  v = [ 3.0, 1.0, -2.0; ...
        0.0, 2.0, -1.0 ];

  for n_log = 0 : 15
    [ c_est, c1_err, c2_err ] = triangle_random_centralize ( n, v );
    fprintf ( 1, '  %2d  %6d  %14.6g  %14.6g\n', m, n, c1_err, c2_err );
    n = n * 2;
  end
  c_est

  fprintf ( 1, '\n' );
  n = 1;
  for n_log = 0 : 15
    [ c_est, c1_err, c2_err ] = triangle_random_centralize2 ( n, v );
    fprintf ( 1, '  %2d  %6d  %14.6g  %14.6g\n', m, n, c1_err, c2_err );
    n = n * 2;
  end
  c_est

  return
end

