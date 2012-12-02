function subset_test026b ( )

%*****************************************************************************80
%
%% TEST026B tests DVEC_ADD and DVEC_SUB;
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
  n = 10;
  seed = 123456789;
  test_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST026B\n' );
  fprintf ( 1, '  DVEC_ADD adds decimal vectors representing integers;\n' );
  fprintf ( 1, '  DVEC_SUB subtracts decimal vectors representing integers;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        I        J        K = I + J    L = I - J\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num
    
    [ i, seed ] = i4_uniform ( -100, 100, seed );
    [ j, seed ] = i4_uniform ( -100, 100, seed );

    fprintf ( 1, '\n' );

    fprintf ( 1, '  %8d  %8d\n', i, j );

    k = i + j;
    l = i - j;

    fprintf ( 1, '  Directly:           %8d  %8d\n', k, l );

    dvec1 = i4_to_dvec ( i, n );
    dvec2 = i4_to_dvec ( j, n );

    dvec3 = dvec_add ( n, dvec1, dvec2 );
    k = dvec_to_i4 ( n, dvec3 );

    dvec4 = dvec_sub ( n, dvec1, dvec2 );
    l = dvec_to_i4 ( n, dvec4 );

    fprintf ( 1, '  DVEC_ADD, DVEC_SUB  %8d  %8d\n', k, l );

  end

  return
end
