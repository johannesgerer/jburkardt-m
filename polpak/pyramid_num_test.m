function pyramid_num_test ( )

%*****************************************************************************80
%
%% PYRAMID_NUM_TEST tests PYRAMID_NUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PYRAMID_NUM_TEST\n' );
  fprintf ( 1, '  PYRAMID_NUM computes the pyramidal numbers.\n' );
  fprintf ( 1, '\n' );
 
  for n = 1 : 10
    fprintf ( 1, '  %2d  %6d\n', n, pyramid_num ( n ) );
  end

  return
end
