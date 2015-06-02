function pyramid_square_num_test ( )

%*****************************************************************************80
%
%% PYRAMID_SQUARE_NUM_TEST tests PYRAMID_SQUARE_NUM.
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
  fprintf ( 1, 'PYRAMID_SQUARE_NUM_TEST\n' );
  fprintf ( 1, '  PYRAMID_SQUARE_NUM computes the pyramidal square numbers.\n' );
  fprintf ( 1, '\n' );
 
  for n = 1 : 10
    fprintf ( 1, '  %2d  %6d\n', n, pyramid_square_num ( n ) );
  end

  return
end
