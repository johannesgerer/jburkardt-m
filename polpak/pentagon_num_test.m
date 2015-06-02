function pentagon_num_test ( )

%*****************************************************************************80
%
%% PENTAGON_NUM_TEST tests PENTAGON_NUM.
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
  fprintf ( 1, 'PENTAGON_NUM_TEST\n' );
  fprintf ( 1, '  PENTAGON_NUM computes the pentagonal numbers.\n' );
  fprintf ( 1, '\n' );
 
  for n = 1 : 10
    p = pentagon_num ( n );
    fprintf ( 1, '  %2d  %6d\n', n, p );
  end
 
  return
end
