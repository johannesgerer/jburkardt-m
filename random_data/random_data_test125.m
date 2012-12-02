function random_data_test125 ( )

%*****************************************************************************80
%
%% TEST125 tests UNIFORM_IN_ANNULUS_SECTOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 August 2005
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  file_out_name = 'uniform_in_annulus_sector.txt';
  n = 400;
  pc = [ 10.0, 5.0 ];
  r1 = 1.0;
  r2 = 3.0;
  seed = 123456789;
  theta1 = 0.0;
  theta2 = 1.5707964;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST125\n' );
  fprintf ( 1, '  UNIFORM_IN_ANNULUS_SECTOR generates uniform \n' );
  fprintf ( 1, '  points in an annular sector by mapping.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension DIM_NUM =   %12d\n', dim_num );
  fprintf ( 1, '  Number of points N =          %12d\n', n );
  fprintf ( 1, '  Center PC(1:2) =              %12f  %12f\n', pc(1:2) );
  fprintf ( 1, '  Inner radius is R1 =          %12f\n', r1 );
  fprintf ( 1, '  Outer radius is R2 =          %12f\n', r2 );
  fprintf ( 1, '  THETA1 =                      %12f\n', theta1 );
  fprintf ( 1, '  THETA2 =                      %12f\n', theta2 );
  fprintf ( 1, '  Initial random number SEED =  %12d\n', seed );
 
  [ x, seed ] = uniform_in_annulus_sector ( pc, r1, r2, theta1, theta2, ...
    n, seed );

  fprintf ( 1, '  Final random number SEED =    %12d\n', seed );

  r8mat_write ( file_out_name, dim_num, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to "%s".\n', file_out_name );

  return
end
