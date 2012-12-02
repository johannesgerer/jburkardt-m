function stroud_test22 ( )

%*****************************************************************************80
%
%% TEST22 tests OCTAHEDRON_UNIT_ND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2009
%
%  Author:
%
%    John Burkardt
%
  global FUNC_ND_INDEX;

  n_max = 3;

  num = function_2d_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST22\n' );
  fprintf ( 1, '  OCTAHEDRON_UNIT_ND approximates integrals in a unit\n' );
  fprintf ( 1, '    octahedron in N dimensions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      F(X)       N = 1         N = 2         N = 3\n' );
  fprintf ( 1, '\n' );
 
  for i = 1 : num

    FUNC_ND_INDEX = i;

    for n = 1 : n_max
      result(n) = octahedron_unit_nd ( 'function_nd', n );
    end

    fname = function_nd_name ( i );

    fprintf ( 1, '  %s', fname );
    for n = 1 : n_max
      fprintf ( 1, '  %12f', result(n) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
