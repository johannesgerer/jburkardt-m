function geometry_test0386 ( )

%*****************************************************************************80
%
%% TEST0386 tests LINES_EXP_EQUAL_2D.
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
  dim_num = 2;
  test_num = 6;

  p1_test = [ ...
    0.0, 0.0; ...
    0.0, 0.0; ...
    0.0, 0.0; ...
    0.0, 0.0; ...
    0.0, 0.0; ...
    0.0, 0.0 ]';
  p2_test = [ ...
    1.0, 2.0; ...
    1.0, 2.0; ...
    1.0, 2.0; ...
    1.0, 2.0; ...
    1.0, 2.0; ...
    1.0, 2.0 ]';
  q1_test = [ ...
    0.0,  0.0; ...
    1.0,  2.0; ...
    0.0,  0.0; ...
    7.0, 14.0; ...
    1.0,  2.0; ...
    0.0, 10.0 ]';
  q2_test = [ ...
    1.0,  2.0; ...
    0.0,  0.0; ...
    2.0,  4.0; ...
    5.5, 11.0; ...
    3.0,  5.0; ...
    1.0, 12.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0386\n' );
  fprintf ( 1, '  LINES_EXP_EQUAL_2D tries to determine if two\n' );
  fprintf ( 1, '    explicit lines in 2D are equal.\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    p1(1:dim_num) = p1_test(1:dim_num,test)';
    p2(1:dim_num) = p2_test(1:dim_num,test)';
    q1(1:dim_num) = q1_test(1:dim_num,test)';
    q2(1:dim_num) = q2_test(1:dim_num,test)';

    fprintf ( 1, '\n' );
    fprintf ( 1, '  P1  %8f  %8f\n', p1(1:dim_num) );
    fprintf ( 1, '  P2  %8f  %8f\n', p2(1:dim_num) );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Q1  %8f  %8f\n', q1(1:dim_num) );
    fprintf ( 1, '  Q2  %8f  %8f\n', q2(1:dim_num) );
 
    equal = lines_exp_equal_2d ( p1, p2, q1, q2 );
 
    if ( equal )
      fprintf ( 1, '  The lines are equal.\n' );
    else
      fprintf ( 1, '  The lines are distinct.\n' );
    end

  end

  return
end
