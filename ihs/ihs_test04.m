function ihs_test04 ( )

%*****************************************************************************80
%
%% IHS_TEST04 tests the improved distributed hypercube sampling algorithm.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2014
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  point_num = 10;
  duplication = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'IHS_TEST04' );
  fprintf ( 1, '  IHS implements the IHS Algorithm\n' );
  fprintf ( 1, '  (Improved Distributed Hypercube Sampling)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Demonstrate the code for a fixed number of points\n' );
  fprintf ( 1, '  dimension, and duplication factor.\n' );

  opt = point_num / point_num^( 1.0 / dim_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension =        %d\n', dim_num );
  fprintf ( 1, '  Number of points =         %d\n', point_num );
  fprintf ( 1, '  Duplication factor =       %d\n', duplication );
  fprintf ( 1, '  Desired minimum distance = %f\n', opt );

  for i = 1 : 4
%
%  Get the points.
%
    x = ihs ( dim_num, point_num, duplication );
%
%  Compute the covariance.
%
    [ average, sd, covc ] = covariance ( dim_num, point_num, x );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Average minimum distance %f\n', average );
    fprintf ( 1, '  Standard deviation:      %f\n', sd );
    fprintf ( 1, '  Covariance:              %f\n', covc );

    fprintf ( 1, '\n' );

    for j = 1 : point_num
      fprintf ( 1, '%4d    ', j );
      for i = 1 : dim_num
        fprintf ( 1, '%4d  ', x(i,j) );
      end
      fprintf ( 1, '\n');
    end

  end

  return
end
