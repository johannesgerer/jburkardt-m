function prob_test036 ( )

%*****************************************************************************80
%
%% TEST036 tests CIRCLE_SAMPLE.
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
  nsample = 1000;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST036\n' );
  fprintf ( 1, '  CIRCLE_SAMPLE samples points in a circle.\n' );

  a = 10.0;
  b = 4.0;
  c = 3.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X coordinate of center is A = %14f\n', a );
  fprintf ( 1, '  Y coordinate of center is B = %14f\n', b );
  fprintf ( 1, '  Radius is C =                 %14f\n', c );

  for i = 1 : nsample
    [ x1, x2, seed ] = circle_sample ( a, b, c, seed );
    x_table(i,1) = x1;
    x_table(i,2) = x2;
  end

  for j = 1 : 2
    mean(j) = r8vec_mean ( nsample, x_table(1:nsample,j) );
    variance(j) = r8vec_variance ( nsample, x_table(1:nsample,j) );
    xmax(j) = max ( x_table(1:nsample,j) );
    xmin(j) = min ( x_table(1:nsample,j) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample size =     %6d\n', nsample );
  fprintf ( 1, '  Sample mean =     %14f  %14f\n', mean(1:2) );
  fprintf ( 1, '  Sample variance = %14f  %14f\n', variance(1:2) );
  fprintf ( 1, '  Sample maximum =  %14f  %14f\n', xmax(1:2) );
  fprintf ( 1, '  Sample minimum =  %14f  %14f\n', xmin(1:2) );

  return
end
