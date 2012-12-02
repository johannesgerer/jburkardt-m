function geometry_test0845 ()

%*****************************************************************************80
%
%% TEST0845 tests POLYLOOP_ARCLENGTH_ND.
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
  n = 4;
  dim_num = 2;

  p = [ ...
    0.0, 0.0; ...
    1.0, 1.0; ...
    2.0, 0.0; ...
    0.0, 0.0 ]';
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0845\n' );
  fprintf ( 1, '  POLYLOOP_ARCLENGTH_ND computes the arclength \n' );
  fprintf ( 1, '    of the nodes of a polyloop.\n' );

  s = polyloop_arclength_nd ( dim_num, n, p );

  fprintf ( 1, '\n' );
  fprintf ( 1, '           P            Arclength(P)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n + 1
    j = i4_wrap ( i, 1, n );
    fprintf ( 1, '  %12f  %12f  %12f\n', p(1:dim_num,j), s(i) );
  end

  return
end
