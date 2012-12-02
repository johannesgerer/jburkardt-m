function prob_test047 ( )

%*****************************************************************************80
%
%% TEST047 tests DIRICHLET_MEAN, DIRICHLET_SAMPLE, DIRICHLET_VARIANCE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 3;
  nsample = 1000;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST047\n' );
  fprintf ( 1, '  For the Dirichlet PDF:\n' );
  fprintf ( 1, '  DIRICHLET_SAMPLE samples;\n' );
  fprintf ( 1, '  DIRICHLET_MEAN computes the mean;\n' );
  fprintf ( 1, '  DIRICHLET_VARIANCE computes the variance.\n' );

  a(1:n) = [ 0.250, 0.500, 1.250 ];

  check = dirichlet_check ( n, a );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST047 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of components N = %6d\n', n );
  fprintf ( 1, '  PDF parameters A(1:N):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %14f\n', i, a(i) );
  end

  mean(1:n) = dirichlet_mean ( n, a );

  variance(1:n) = dirichlet_variance ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF mean, variance:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %6d  %14f  %14f\n', i, mean(i), variance(i) );
  end

  m2(1:n,1:n) = dirichlet_moment2 ( n, a );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Second moments:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %14f  %14f  %14f\n', m2(i,1:n) );
  end

  for i = 1 : nsample
    [ x(1:n,i), seed ] = dirichlet_sample ( n, a, seed );
  end
 
  xmax(1:n) = r8row_max ( n, nsample, x );
  xmin(1:n) = r8row_min ( n, nsample, x );
  mean(1:n) = r8row_mean ( n, nsample, x );
  variance(1:n) = r8row_variance ( n, nsample, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample size = %d', nsample )

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Observed Min, Max, Mean, Variance:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %6d  %14f  %14f  %14f  %14f\n', ...
      i, xmin(i), xmax(i), mean(i), variance(i) );
  end

  return
end
