function gm_rule_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests GM_RULE_SIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 July 2007
%
%  Author:
%
%    John Burkardt
%
  test_num = 4;

  dim_num_test = [ 2, 3, 5, 10 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  GM_RULE_SIZE returns POINT_NUM, the number of points\n' );
  fprintf ( 1, '  associated with a Grundmann-Moeller quadrature rule\n' );
  fprintf ( 1, '  for the unit simplex of dimension DIM_NUM\n' );
  fprintf ( 1, '  with rule index RULE\n' );
  fprintf ( 1, '  and degree of exactness DEGREE = 2*RULE+1.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   DIM_NUM      RULE    DEGREE POINT_NUM\n' );

  for test = 1 : test_num

    dim_num = dim_num_test(test);

    fprintf ( 1, '\n' );

    for rule = 0 : 5

      point_num = gm_rule_size ( rule, dim_num );
      degree = 2 * rule + 1;

      fprintf ( 1, '  %8d  %8d  %8d  %8d\n', dim_num, rule, degree, point_num );

    end

  end

  return
end
