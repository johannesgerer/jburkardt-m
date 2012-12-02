function subset_test155 ( )

%*****************************************************************************80
%
%% TEST155 tests VEC_GRAY_NEXT, VEC_GRAY_RANK, VEC_GRAY_UNRANK.
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
  n = 4;
  base = [ 2, 2, 1, 4 ];
  number = prod ( base );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST155\n' );
  fprintf ( 1, '  VEC_GRAY_NEXT generates product space elements.\n' );
  fprintf ( 1, '  VEC_GRAY_RANK ranks them.\n' );
  fprintf ( 1, '  VEC_GRAY_UNRANK unranks them.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of components is %d\n', n );
  fprintf ( 1, '  The number of elements is %d\n', number );
  fprintf ( 1, '  Each component has its own number of degrees of\n' );
  fprintf ( 1, '  freedom, which, for this example, are:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rank Change     ' );
  for i = 1 : n
    fprintf ( 1, '  %4d', base(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  rank = 0;
  
  a = [];
  done = 1;
 
  while ( 1 )
 
    rank = rank + 1;
 
    [ a, done, change ] = vec_gray_next ( n, base, a, done );
 
    if ( done )
      break
    end

    fprintf ( 1, '  %4d  %4d      ', rank, change );
    for i = 1 : n
      fprintf ( 1, '  %4d', a(i) );
    end
    fprintf ( 1, '\n' );

  end
 
  a(1:n) = floor ( base(1:n) / 2 );

  rank = vec_gray_rank ( n, base, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  VEC_GRAY_RANK reports the element \n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %4d', a(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  has rank %d\n', rank );

  rank = 7;
  a = vec_gray_unrank ( n, base, rank );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  VEC_GRAY_UNRANK reports the element of rank %d\n', rank );
  fprintf ( 1, '  is:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %4d', a(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );

  return
end
