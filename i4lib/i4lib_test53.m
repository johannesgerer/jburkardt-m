function i4lib_test53 ( )

%*****************************************************************************80
%
%% TEST53 tests I4VEC_DIRECT_PRODUCT2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  factor_num = 3;
  point_num = 24;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST53\n' );
  fprintf ( 1, '  I4VEC_DIRECT_PRODUCT2 forms the entries of a\n' );
  fprintf ( 1, '  direct product of a given number of I4VEC factors.\n' );

  w(1:factor_num,1:point_num) = 1;

  for factor_index = 1 : factor_num

    if ( factor_index == 1 )
      factor_order = 4;
      factor_value = [ 1, 2, 3, 4 ];
    elseif ( factor_index == 2 )
      factor_order = 3;
      factor_value = [ 50, 60, 70 ];
    elseif ( factor_index == 3 )
      factor_order = 2;
      factor_value = [ 800, 900 ];
    end
  
    w = i4vec_direct_product2 ( factor_index, factor_order, factor_value, ...
      factor_num, point_num, w );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '     J             W(J)\n' );
  fprintf ( 1, '\n' );

  for j = 1 : point_num
    fprintf ( 1, '  %4d      %8d\n', j, w(j) );
  end

  return
end
