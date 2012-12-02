function geometry_test048 ( )

%*****************************************************************************80
%
%% TEST048 tests PARALLELOGRAM_CONTAINS_POINT_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  ntest = 4;
%
%  In
%
  xtest(1) = 1.0;
  ytest(1) = 0.5;
%
%  Out
%
  xtest(2) = 2.0;
  ytest(2) = 0.0;
%
%  Out
%
  xtest(3) = 0.5;
  ytest(3) = -0.1;
%
%  Out
%
  xtest(4) = 0.1;
  ytest(4) = 0.5;

  p1(1:dim_num) = [ 0.0, 0.0 ];
  p2(1:dim_num) = [ 1.0, 0.0 ];
  p3(1:dim_num) = [ 1.0, 1.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST048\n' );
  fprintf ( 1, '  PARALLELOGRAM_CONTAINS_POINT_2D determines if a point \n' );
  fprintf ( 1, '    is within a parallelogram in 2D.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       P     Inside?\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    p(1) = xtest(i);
    p(2) = ytest(i);

    inside = parallelogram_contains_point_2d ( p1, p2, p3, p );

    fprintf ( 1, '  %12f  %12f  %d\n', p(1:dim_num), inside );

  end

  return
end
