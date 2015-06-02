function spquad_test02 ( )

%*****************************************************************************80
%
%% SPQUAD_TEST02 reports the size of various sparse grids.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 January 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPQUAD_TEST02:\n' );
  fprintf ( 1, '  Print out the order (number of points) used\n' );
  fprintf ( 1, '  for sparse grids of various levels and spatial dimensions.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Dimension / Level size table for Sparse Grid Rule\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ' Dim:  ' )
  for d = 1 : 10
    fprintf ( 1, '  %6d', d );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Level:\n' );
  for k = 0 : 5
    fprintf ( 1, '  %2d:  ', k );
    for d = 1 : 10
      [ x, w ] = spquad ( d, k );
      n = length ( w );
      fprintf ( 1, '  %6d', n );
    end
    fprintf ( 1, '\n' );
  end

  return
end

