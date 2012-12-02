function random_data_test15 ( )

%*****************************************************************************80
%
%% TEST15 tests UNIFORM_IN_ELLIPSOID_MAP.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2006
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  file_out_name = 'uniform_in_ellipsoid_map.txt';
  n = 1000;
  a = [ 3.0, 1.0; ...
        1.0, 2.0 ]';
  r = 1.0;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST15\n' );
  fprintf ( 1, '  UNIFORM_IN_ELLIPSOID_MAP maps uniform \n' );
  fprintf ( 1, '  points into an ellipsoid.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM =   %12d\n', dim_num );
  fprintf ( 1, '  Number of points N =          %12d\n', n );
  fprintf ( 1, '  Initial random number SEED =  %12d\n', seed );

  [ x, seed ] = uniform_in_ellipsoid_map ( dim_num, n, a, r, seed );

  fprintf ( 1, '  Final random number SEED =    %12d\n', seed );

  r8mat_write ( file_out_name, dim_num, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to "%s".\n', file_out_name );
%
%  Test the data.
%
  fail_num = 0;
  success_num = 0;

  for j = 1 : n
    
    r2 = sqrt ( x(1:dim_num,j)' * a(1:dim_num,1:dim_num) * x(1:dim_num,j) ) ;

    if ( r < r2 )
      fail_num = fail_num + 1;
    else
      success_num = success_num + 1;
    end

  end
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %d points failed the ellipsoid test.\n', fail_num );
  fprintf ( 1, '  %d points satisfy the ellipsoid test.\n', success_num );
  
  return
end
