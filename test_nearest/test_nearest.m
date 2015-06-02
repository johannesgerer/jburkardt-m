function test_nearest ( )

%*****************************************************************************80
%
%% TEST_NEAREST compares the performance of nearest neighbor routines.
%
%  Discussion:
%
%    We are given R, a set of NR points in M dimensions.
%
%    We are given S, a set of NS points in M dimensions.
%
%    For each S(I) in S, we seek the index J of the point R(J)
%    which is nearest to S(I) over all points in R.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 December 2012
%
%  Author:
%
%    John Burkardt
%
%  Local parameters:
%
%    Local, integer M, the spatial dimension.
%
%    Local, integer NR, the number of data points.
%
%    Local, integer NS, the number of sample points.
%
%    Local, real R(M,NR), the data points.
%
%    Local, real RT(NR,M), the transposed data points.
%
%    Local, real S(M,NS), the sample points. 
%
%    Local, real ST(NS,M), the transposed sample points. 
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_NEAREST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Consider various nearest neighbor algorithms.\n' );

  m_test_num = 3;
  m_test_data = [ 2, 4, 8 ];

  n_test_num = 6;

  ns_test_data = [      10,    100,  1000, 10000, 100000, 1000000 ]';
  nr_test_data = [ 1000000, 100000, 10000,  1000,    100,      10 ]';

  for m_test = 1 : m_test_num

    m = m_test_data(m_test);

    for test = 1 : n_test_num

      nr = nr_test_data(test);
      ns = ns_test_data(test);

      seed = 123456789;
      rand ( 'twister', seed );
      s = rand ( m, ns );
      r = rand ( m, nr );
      st = s';
      rt = r';

      fprintf ( 1, '\n' );
      fprintf ( 1, '  M = %d, NR = %d, NS = %d\n', m, nr, ns );
      tic;
      nearest = find_closest1 ( m, nr, r, ns, s );
      t1 = toc;
      fprintf ( 1, '  #1 time: %8.3f, size = %d, i(1) = %d\n', t1, length ( nearest ), nearest(1) );

      tic;
      nearest = find_closest2 ( m, nr, r, ns, s );
      t2 = toc;
      fprintf ( 1, '  #2 time: %8.3f, size = %d, i(1) = %d\n', t2, length ( nearest ), nearest(1) );

      tic;
      nearest = find_closest3 ( m, nr, r, ns, s );
      t3 = toc;
      fprintf ( 1, '  #3 time: %8.3f, size = %d, i(1) = %d\n', t3, length ( nearest ), nearest(1) );

      tic;
      nearest = dsearchn ( rt, st );
      t4 = toc;
      fprintf ( 1, '  #4 time: %8.3f, size = %d, i(1) = %d\n', t4, length ( nearest ), nearest(1) );

      if ( ( m == 2 & 100000 <= nr ) || ...
           ( m == 4 &  10000 <= nr ) || ...
           ( m == 8 &   1000 <= nr ) )
        fprintf ( 1, '  #5 skipped!\n' );
      else
        tic;
        tri = delaunayn ( rt );
        t51 = toc;
        tic;
        nearest = dsearchn ( rt, tri, st );
        t52 = toc;
        t5 = t51 + t52;
        fprintf ( 1, '  #5 time: %8.3f (for Delaunay triangulation)\n', t51 );
        fprintf ( 1, '  #5 time: %8.3f (for Delaunay search)\n', t52 );
        fprintf ( 1, '  #5 time: %8.3f, size = %d, i(1) = %d\n', t5, length ( nearest ), nearest(1) );
      end

      tic;
      nearest = knnsearch ( rt, st, 'k', 1 );
      t6 = toc;
      fprintf ( 1, '  #6 time: %8.3f, size = %d, i(1) = %d\n', t6, length ( nearest ), nearest(1) );

      tic;
      nearest = nearest_neighbor ( s, r );
      t7 = toc;
      fprintf ( 1, '  #7 time: %8.3f, size = %d, i(1) = %d\n', t7, length ( nearest ), nearest(1) );

    end

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_NEAREST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
