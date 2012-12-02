function subset_test1536 ( )

%*****************************************************************************80
%
%% TEST1536 tests VEC_COLEX_NEXT2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;
  base = [ 2, 1, 3 ];
  more = 0;
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1536\n' );
  fprintf ( 1, '  VEC_COLEX_NEXT2 generates all DIM_NUM-vectors\n' );
  fprintf ( 1, '  in colex order in a given base BASE.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The base vector:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : dim_num
    fprintf ( 1, '  %2d', base(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  
  a = [];
  
  while ( 1 )

    [ a, more ] = vec_colex_next2 ( dim_num, base, a, more );

    if ( ~more )
      break
    end

    for i = 1 : dim_num
      fprintf ( 1, '  %2d', a(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
