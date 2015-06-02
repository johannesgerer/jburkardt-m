function r8vec_direct_product2_test ( )

%*****************************************************************************80
%
%% R8VEC_DIRECT_PRODUCT2_TEST tests R8VEC_DIRECT_PRODUCT2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  factor_num = 3;
  point_num = 24;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_DIRECT_PRODUCT2_TEST\n' );
  fprintf ( 1, '  R8VEC_DIRECT_PRODUCT2 forms the entries of a\n' );
  fprintf ( 1, '  direct product of a given number of R8VEC factors.\n' );

  w(1:factor_num,1:point_num) = 1.0;

  for factor_index = 1 : factor_num

    if ( factor_index == 1 )
      factor_order = 4;
      factor_value = [ 1.0, 2.0, 3.0, 4.0 ];
    elseif ( factor_index == 2 )
      factor_order = 3;
      factor_value = [ 50.0, 60.0, 70.0 ];
    elseif ( factor_index == 3 )
      factor_order = 2;
      factor_value = [ 800.0, 900.0 ];
    end
  
    w = r8vec_direct_product2 ( factor_index, factor_order, factor_value, ...
      factor_num, point_num, w );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '     J             W(J)\n' );
  fprintf ( 1, '\n' );

  for j = 1 : point_num
    fprintf ( 1, '  %4d      %8f\n', j, w(j) );
  end

  return
end
