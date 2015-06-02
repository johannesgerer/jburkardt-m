function point_merge_test ( )

%*****************************************************************************80
%
%% POINT_MERGE_TEST tests the POINT_MERGE library.
%
%  Discussion:
%
%    Compare correctness of the codes.
%
%    Compare speed of the codes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 July 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POINT_MERGE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the POINT_MERGE library.\n' );
%
%  TEST01 gives me some confidence that, at least for zero-tolerance,
%  the radial approach is accurate, as compared to the "Unique count"
%  (which cannot be extended to a tolerance version in multidimensions)
%  and the "Tol Unique Count", which is an O(N^2) algorithm.
%
  m = 3;
  n = 10;
  n_unique = 7;
  seed = 123456789;
  point_merge_test01 ( m, n, n_unique, seed );

  m = 4;
  n = 20;
  n_unique = 11;
  seed = 987654321;
  point_merge_test01 ( m, n, n_unique, seed );
%
%  In TEST02, I want to compute the same data, but with "blurred"
%  duplicates, and a tolerance version of the radial approach,
%  compared to "Tol Unique Count".
%
  m = 3;
  n = 10;
  n_unique = 7;
  tol = 0.00001;
  seed = 123456789;
  point_merge_test02 ( m, n, n_unique, tol, seed );

  m = 4;
  n = 20;
  n_unique = 11;
  tol = 0.00001;
  seed = 987654321;
  point_merge_test02 ( m, n, n_unique, tol, seed );
%
%  In TEST03, I want to measure the time required for a sequence
%  of increasingly hard problems.
%
  m = 3;
  n = 100;
  n_unique = n / 2;
  tol = 0.00001;
  seed = 123456789;
  point_merge_test03 ( m, n, n_unique, tol, seed );

  m = 3;
  n = 1000;
  n_unique = n / 2;
  tol = 0.00001;
  seed = 123456789;
  point_merge_test03 ( m, n, n_unique, tol, seed );

  if ( 0 )
    m = 3;
    n = 10000;
    n_unique = n / 2;
    tol = 0.00001;
    seed = 123456789;
    point_merge_test03 ( m, n, n_unique, tol, seed );
  end

  if ( 0 )
    m = 3;
    n = 100000;
    n_unique = n / 2;
    tol = 0.00001;
    seed = 123456789;
    point_merge_test03 ( m, n, n_unique, tol, seed );
  end
%
%  In TEST04, repeat TEST02, but now compute the index vector.
%
  m = 3;
  n = 10;
  n_unique = 7;
  tol = 0.00001;
  seed = 123456789;
  point_merge_test04 ( m, n, n_unique, tol, seed );

  m = 4;
  n = 20;
  n_unique = 11;
  tol = 0.00001;
  seed = 987654321;
  point_merge_test04 ( m, n, n_unique, tol, seed );
%
%  In TEST05, I want to measure the time required for a sequence
%  of increasingly hard problems.
%
  m = 3;
  n = 100;
  n_unique = n / 2;
  tol = 0.00001;
  seed = 123456789;
  point_merge_test05 ( m, n, n_unique, tol, seed );

  m = 3;
  n = 1000;
  n_unique = n / 2;
  tol = 0.00001;
  seed = 123456789;
  point_merge_test05 ( m, n, n_unique, tol, seed );

  if ( 1 )
    m = 3;
    n = 10000;
    n_unique = n / 2;
    tol = 0.00001;
    seed = 123456789;
    point_merge_test05 ( m, n, n_unique, tol, seed );
  end

  if ( 0 )
    m = 3;
    n = 100000;
    n_unique = n / 2;
    tol = 0.00001;
    seed = 123456789;
    point_merge_test05 ( m, n, n_unique, tol, seed );
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POINT_MERGE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
