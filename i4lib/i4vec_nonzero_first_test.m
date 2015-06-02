function i4vec_nonzero_first_test ( )

%*****************************************************************************80
%
%% I4VEC_NONZERO_FIRST_TEST tests I4VEC_NONZERO_FIRST.
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
  n = 10;
  test_num = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_NONZERO_FIRST_TEST\n' );
  fprintf ( 1, '  For an integer vector:\n' );
  fprintf ( 1, '  I4VEC_NONZERO_FIRST left shifts the nonzero entries\n' );
  fprintf ( 1, '  of an I4VEC so they appear first.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '  ----------Before--------------    ----------After---------------\n' );
  fprintf ( 1, '\n' );
  seed = 123456789;

  ilo = -1;
  ihi = +2;

  for test = 1 : test_num

    [ a, seed ] = i4vec_uniform_ab ( n, ilo, ihi, seed );
    a_save(1:n) = a(1:n);
    [ a, nz, indx ] = i4vec_nonzero_first ( n, a );
    fprintf ( 1, '  ' );
    for i = 1 : n
      fprintf ( 1, '%3d', a_save(i) );
    end
    fprintf ( 1, '    ' );
    for i = 1 : n
      fprintf ( 1, '%3d', a(i) );
    end
    fprintf ( 1, '\n' );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The value NZ counts the nonzeros, and\n' );
  fprintf ( 1, '  the vector INDX indicates the original positions:\n' );
  fprintf ( 1, '\n' );

  [ a, seed ] = i4vec_uniform_ab ( n, ilo, ihi, seed );
  a_save(1:n) = a(1:n);
  [ a, nz, indx ] = i4vec_nonzero_first ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Original vector:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ' );
  for i = 1 : n
    fprintf ( 1, '%3d', a_save(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nonzeros NZ = %d\n', nz );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Shifted vector:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ' );
  for i = 1 : n
    fprintf ( 1, '%3d', a(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Index vector:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ' );
  for i = 1 : n
    fprintf ( 1, '%3d', indx(i) );
  end
  fprintf ( 1, '\n' );

  return
end
