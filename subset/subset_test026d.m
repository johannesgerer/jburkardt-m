function subset_test0260 ( )

%*****************************************************************************80
%
%% TEST026D tests DVEC_MUL;
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
  test2_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST026D\n' );
  fprintf ( 1, '  DVEC_MUL multiplies decimal vectors \n' );
  fprintf ( 1, '  representing integers;\n' );

  for test2 = 1 : test2_num

    if ( test2 == 1 )

      n2 = n;

    elseif ( test2 == 2 )

      n2 = 6;

      fprintf ( 1, '\n' );
      fprintf ( 1, '  NOW REPEAT THE TEST...\n' );
      fprintf ( 1, '\n' );
      fprintf ( 1, '  but use too few digits to represent big products.\n' );
      fprintf ( 1, '  This corresponds to an "overflow".\n' );
      fprintf ( 1, '  The result here should get the final decimal\n' );
      fprintf ( 1, '  digits correctly, though.\n' );

    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '        I        J        K = I * J\n' );
    fprintf ( 1, '\n' );

    for test = 1 : test_num
    
      [ i, seed ] = i4_uniform ( -1000, 1000, seed );
      [ j, seed ] = i4_uniform ( -1000, 1000, seed );

      fprintf ( 1, '\n' );

      fprintf ( 1, '  %8d  %8d\n', i, j );

      k = i * j;

      fprintf ( 1, '  Directly:           %8d\n', k );

      dvec1 = i4_to_dvec ( i, n2 );
      dvec2 = i4_to_dvec ( j, n2 );
      dvec3 = dvec_mul ( n2, dvec1, dvec2 );
      k = dvec_to_i4 ( n2, dvec3 );

      fprintf ( 1, '  DVEC_MUL            %8d\n', k );

    end

  end

  return
end
