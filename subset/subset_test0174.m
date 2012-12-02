function subset_test0174 ( )

%*****************************************************************************80
%
%% TEST0174 tests COMPNZ_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 August 2008
%
%  Author:
%
%    John Burkardt
%
  k = 3;
  more = 0;
  n = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0174\n' );
  fprintf ( 1, '  COMPNZ_NEXT generates compositions\n' );
  fprintf ( 1, '  with nonzero parts.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Seeking all compositions of N = %d\n', n );
  fprintf ( 1, '  using %d nonzero parts.\n', k );
  fprintf ( 1, '\n' );

  a = [];
  
  while ( 1 )

    [ a, more ] = compnz_next ( n, k, a, more );
    
    fprintf ( 1, '  ' );
    for i = 1 : k
      fprintf ( 1, '%2d  ', a(i) );
    end
    fprintf ( 1, '\n' );

    if ( ~more )
      break
    end

  end

  return
end
