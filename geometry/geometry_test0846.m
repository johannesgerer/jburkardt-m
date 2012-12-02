function geometry_test0846 ()

%*****************************************************************************80
%
%% TEST0846 tests POLYLOOP_POINTS_ND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  nk = 4;
  nt = 12;

  pk = [ ...
    0.0, 2.0; ...
    0.0, 0.0; ...
    1.0, 0.0; ...
    1.0, 2.0]';
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0846\n' );
  fprintf ( 1, '  POLYLOOP_POINTS_ND computes points on a polyloop.\n' );

  r8mat_transpose_print ( dim_num, nk, pk, '  The defining points:' );

  pt = polyloop_points_nd ( dim_num, nk, pk, nt );
 
  r8mat_transpose_print ( dim_num, nt, pt, '  The computed points:' );

  return
end
