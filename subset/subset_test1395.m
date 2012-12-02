function subset_test1395 ( )

%*****************************************************************************80
%
%% TEST1395 tests R8VEC_MIRROR_NEXT.
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
  n = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1395\n' );
  fprintf ( 1, '  R8VEC_MIRROR_NEXT generates all sign variations\n' );
  fprintf ( 1, '    of a real vector.\n' );

  a(1:n) = [ 1.0, 2.0, 3.0 ];

  while ( 1 )

    r8vec_print ( n, a, '  Next vector:' );

    [ a, done ] = r8vec_mirror_next ( n, a );

    if ( done )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Done.\n' );
      break
    end

  end

  a(1:n) = [ 1.0, 0.0, 3.0 ];

  while ( 1 )

    r8vec_print ( n, a, '  Next vector:' );

    [ a, done ] = r8vec_mirror_next ( n, a );

    if ( done )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Done.\n' );
      break
    end

  end

  return
end
