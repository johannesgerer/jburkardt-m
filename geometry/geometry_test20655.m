function geometry_test20655 ( )

%*****************************************************************************80
%
%% TEST20655 tests TRIANGLE_BARYCENTRIC_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2010
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  ntest = 7;

  p_test = [ ...
     0.25,   0.25; ...
     0.75,   0.25; ...
     1.00,   1.00; ...
    11.00,   0.50; ...
     0.00,   1.00; ...
     0.50, -10.00; ...
     0.60,   0.60 ]';
  t = [ ...
    0.0, 1.0; ...
    0.0, 0.0; ...
    1.0, 0.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST20655\n' );
  fprintf ( 1, '  For a triangle in 2D,\n' );
  fprintf ( 1, '  TRIANGLE_BARYCENTRIC_2D converts XY coordinates\n' );
  fprintf ( 1, '    to barycentric XSI coordinates;\n' );

  r8mat_transpose_print ( dim_num, 3, t, '  Triangle vertices:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   X       Y     XSI\n' );
  fprintf ( 1, '\n' );

  for j = 1 : ntest

    p(1:dim_num) = p_test(1:dim_num,j);

    xsi = triangle_barycentric_2d ( t, p );

    fprintf ( 1, '  %10f  %10f    %10f\n', p(1:dim_num), xsi(dim_num+1) );

  end

  return
end
