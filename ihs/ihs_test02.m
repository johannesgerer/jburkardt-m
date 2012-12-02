function ihs_test02 ( )

%*****************************************************************************80
%
%% IHS_TEST02 tests the improved distributed hypercube sampling algorithm.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 March 2004
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  point_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'IHS_TEST02' );
  fprintf ( 1, '  IHS implements the IHS Algorithm\n' );
  fprintf ( 1, '  (Improved Distributed Hypercube Sampling)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Demonstrate the code for a fixed number of points\n' );
  fprintf ( 1, '  and dimension, but vary the duplication value.\n' );

  opt = point_num / point_num^( 1.0E+00 / dim_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension =        %d\n', dim_num );
  fprintf ( 1, '  Number of points =         %d\n', point_num );
  fprintf ( 1, '  Desired minimum distance = %f\n', opt );

  for duplication = 1 : 5

    seed = 17;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Random number seed =       %d\n', seed );
    fprintf ( 1, '  Duplication factor =       %d\n', duplication );
%
%  Get the points.
%
    [ x, seed ] = ihs ( dim_num, point_num, duplication, seed );
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
