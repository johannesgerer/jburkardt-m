function subset_test0686 ( )

%*****************************************************************************80
%
%% TEST0686 tests I4VEC_PAIRWISE_PRIME;
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
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0686\n' );
  fprintf ( 1, '  I4VEC_PAIRWISE_PRIME is true if an integer vector\n' );
  fprintf ( 1, '  is pairwise prime.\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for i = 1 : 5

    [ a, seed ] = i4vec_uniform ( n, 1, n, seed );

    i4vec_print ( n, a, '  The integer array to check:' );
 
    pairwise_prime = i4vec_pairwise_prime ( n, a );

    if ( pairwise_prime )
      fprintf ( 1, '  The preceding vector is pairwise prime.\n' );
    else
      fprintf ( 1, '  The preceding vector is not pairwise prime.\n' );
    end

  end

  return
end
