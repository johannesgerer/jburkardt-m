function geometry_test03855 ( )

%*****************************************************************************80
%
%% TEST03855 tests LINES_EXP_NEAR_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;
  test_num = 2;

  p1_test(1:dim_num,1:test_num) = [ ...
    0.0,  0.0, 0.0;
    4.0, -3.0, 0.0 ]';
  p2_test(1:dim_num,1:test_num) = [ ...
    1.0, 2.0, 0.0;
   -8.0, 6.0, 0.0 ]';
  q1_test(1:dim_num,1:test_num) = [ ...
    0.0, 3.0,  3.0;
    3.0, 4.0, -1.0 ]';
  q2_test(1:dim_num,1:test_num) = [ ...
    3.0, 0.0, 3.0;
    3.0, 4.0, 3.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03855\n' );
  fprintf ( 1, '  LINES_EXP_NEAR_3D finds nearest points on\n' );
  fprintf ( 1, '    two explicit lines in 3D.\n' );

  for test = 1 : test_num

    p1(1:dim_num) = p1_test(1:dim_num,test)';
    p2(1:dim_num) = p2_test(1:dim_num,test)';
    q1(1:dim_num) = q1_test(1:dim_num,test)';
    q2(1:dim_num) = q2_test(1:dim_num,test)';

    fprintf ( 1, '\n' );
    fprintf ( 1, '  P1  %8f  %8f  %8f\n', p1(1:dim_num) );
    fprintf ( 1, '  P2  %8f  %8f  %8f\n', p2(1:dim_num) );
    fprintf ( 1, '  Q1  %8f  %8f  %8f\n', q1(1:dim_num) );
    fprintf ( 1, '  Q2  %8f  %8f  %8f\n', q2(1:dim_num) );

    [ pn, qn ] = lines_exp_near_3d ( p1, p2, q1, q2 );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  PN  %8f  %8f  %8f\n', pn(1:dim_num) );
    fprintf ( 1, '  QN  %8f  %8f  %8f\n', qn(1:dim_num) );

  end

  return
end
