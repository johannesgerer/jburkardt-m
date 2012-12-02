function subset_test154 ( )

%*****************************************************************************80
%
%% TEST154 tests VEC_LEX_NEXT.
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
  base = 3;
  more = 0;
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST154\n' );
  fprintf ( 1, '  VEC_LEX_NEXT generates all DIM_NUM-vectors\n' );
  fprintf ( 1, '  in lex order in a given base BASE.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The spatial dimension DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  The base BASE =                 %d\n', base );
  fprintf ( 1, '\n' );
  
  a = [];
  
  while ( 1 )

    [ a, more ] = vec_lex_next ( dim_num, base, a, more );

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
