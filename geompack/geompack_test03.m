function geompack_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests R82VEC_SORT_QUICK_A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2009
%
%  Author:
%
%    John Burkardt
%
  n = 12;
  ndim = 2;

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  R82VEC_SORT_QUICK_A sorts a D2 vector\n' );
  fprintf ( 1, '    as part of a quick sort.\n' );
  fprintf ( 1, '  Using initial random number seed = %d\n', seed );

  [ a, seed ] = r8mat_uniform_01 ( ndim, n, seed );

  a(1:ndim,1:n) = 10.0 * a(1:ndim,1:n);
%
%  For better testing, give a few elements the same first component.
%
  a(1,3) = a(1,5);
  a(1,4) = a(1,12);
%
%  Make two entries equal.
%
  a(1:2,7) = a(1:2,11);

  r8mat_transpose_print ( ndim, n, a, '  Before sorting:' );

  a = r82vec_sort_quick_a ( n, a );

  r8mat_transpose_print ( ndim, n, a, '  Sorted array:' );

  return
end
