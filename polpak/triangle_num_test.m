function triangle_num_test ( )

%*****************************************************************************80
%
%% TRIANGLE_NUM_TEST tests TRIANGLE_NUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_NUM_TEST\n' );
  fprintf ( 1, '  TRIANGLE_NUM computes the triangular numbers.\n' );
  fprintf ( 1, '\n' );
 
  for n = 1 : 10
    fprintf ( 1, '  %2d  %6d\n', n, triangle_num ( n ) );
  end

  return
end
