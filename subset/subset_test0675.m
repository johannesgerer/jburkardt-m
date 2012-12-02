function subset_test0675 ( )

%*****************************************************************************80
%
%% TEST0675 tests I4VEC_DESCENDS;
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
  fprintf ( 1, 'TEST0675\n' );
  fprintf ( 1, '  I4VEC_DESCENDS is true if an integer vector decreases.\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for i = 1 : 5

    [ a, seed ] = i4vec_uniform ( n, 1, n, seed );

    i4vec_print ( n, a, '  The integer array to search:' );
 
    descends = i4vec_descends ( n, a );

    if ( descends )
      fprintf ( 1, '  The preceding vector is descending.\n' );
    else
      fprintf ( 1, '  The preceding vector is not descending.\n' );
    end

  end

  return
end
