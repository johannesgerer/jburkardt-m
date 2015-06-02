function r8vec_sorted_unique_count_test ( )

%*****************************************************************************80
%
%% R8VEC_SORTED_UNIQUE_COUNT_TEST tests R8VEC_SORTED_UNIQUE_COUNT;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2005
%
%  Author:
%
%    John Burkardt
%
  n = 30;
  tol = 0.25;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8VEC_SORTED_UNIQUE_COUNT_TEST\n' );
  fprintf ( 1, '  R8VEC_SORTED_UNIQUE_COUNT counts the unique entries\n' );
  fprintf ( 1, '  of a sorted R8VEC;\n' );

  b = 0.0;
  c = n;
  seed = 123456789;

  [ a, seed ] = r8vec_uniform_ab ( n, b, c, seed );

  a(1:n) = floor ( a(1:n) );
 
  unique_num = r8vec_sorted_unique_count ( n, a, tol );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using a tolerance of %f\n', tol );
  fprintf ( 1, ...
    '  R8VEC_SORTED_UNIQUE_COUNT counts %d unique entries in A.\n', ...
    unique_num );

  return
end
