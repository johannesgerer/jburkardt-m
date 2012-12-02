function subset_test079 ( )

%*****************************************************************************80
%
%% TEST079 tests MOEBIUS_MATRIX.
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
  clear

  n = 11;

  h = [ ...
    0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0; ...
    0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0; ...
    1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0; ...
    1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0; ...
    0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0; ...
    0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0; ...
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; ...
    0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0; ...
    0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1; ...
    0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0; ...
    0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST079\n' );
  fprintf ( 1, '  MOEBIUS_MATRIX computes the Moebius matrix.\n' );
 
  i4mat_print ( n, n, h, '  The input matrix:' );

  matrix = moebius_matrix ( n, h );
 
  i4mat_print ( n, n, matrix, '  The Moebius matrix:' );

  return
end
