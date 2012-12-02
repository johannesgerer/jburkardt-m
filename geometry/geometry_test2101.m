function geometry_test2101 ( )

%*****************************************************************************80
%
%% TEST2101 tests TRIANGLE_CIRCUMCENTER_2D and others.
%
%  Discussion:
%
%    The functions tested include
%    * TRIANGLE_CIRCUMCENTER_2D;
%    * TRIANGLE_CIRCUMCENTER_2D_2;
%    * TRIANGLE_CIRCUMCENTER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2010
%
%  Author:
%
%    John Burkardt
%
  m = 2;
  test_num = 4;
  t_test = cat ( 3, ...
    [ 10.0,  5.0; 
      11.0,  5.0; ...
      10.0,  6.0 ]', ...
    [ 10.0,  5.0; ...
      11.0,  5.0; ...
      10.5,  5.86602539 ]', ...
    [ 10.0,  5.0; ...
      11.0,  5.0; ...
      10.5, 15.0 ]', ...
    [ 10.0,  5.0; ...
      11.0,  5.0; ...
      20.0,   7.0 ]' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST2101\n' );
  fprintf ( 1, '  For a triangle in 2D, the circumcenter can be computed by:\n' );
  fprintf ( 1, '  TRIANGLE_CIRCUMCENTER_2D;\n' );
  fprintf ( 1, '  TRIANGLE_CIRCUMCENTER_2D_2;\n' );
  fprintf ( 1, '  TRIANGLE_CIRCUMCENTER (any dimension)\n' );

  for test = 1 : test_num

    t(1:m,1:3) = t_test(1:m,1:3,test);

    r8mat_print ( m, 3, t, '  Triangle vertices ( columns )' );

    pc = triangle_circumcenter_2d ( t );

    r8vec_print ( m, pc, '  Circumcenter by TRIANGLE_CIRCUMCENTER_2D:' );

    pc = triangle_circumcenter_2d_2 ( t );

    r8vec_print ( m, pc, '  Circumcenter by TRIANGLE_CIRCUMCENTER_2D_2:' );

    pc = triangle_circumcenter ( m, t );

    r8vec_print ( m, pc, '  Circumcenter by TRIANGLE_CIRCUMCENTER:' );

  end

  return
end
