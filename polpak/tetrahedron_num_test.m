function tetrahedron_num_test ( )

%*****************************************************************************80
%
%% TETRAHEDRON_NUM_TEST tests TETRAHEDRON_NUM.
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
  fprintf ( 1, 'TETRAHEDRON_NUM_TEST\n' );
  fprintf ( 1, '  TETRAHEDRON_NUM computes the tetrahedron numbers.\n' );
  fprintf ( 1, '\n' );
 
  for n = 1 : 10
    fprintf ( 1, '  %2d  %6d\n', n, tetrahedron_num ( n ) );
  end

  return
end
