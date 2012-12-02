function i4lib_test51 ( )

%*****************************************************************************80
%
%% TEST51 tests I4VEC_DESCENDS.
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
  n = 4;
  test_num = 6;
%
%  Each ROW of this definition is a COLUMN of the matrix.
%
  x_test = [ ...
    1, 3, 2, 4; ...
    2, 2, 2, 2; ...
    1, 2, 2, 4; ...
    1, 2, 3, 4; ...
    4, 4, 3, 1; ...
    9, 7, 3, 0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST51\n' );
  fprintf ( 1, '  I4VEC_DESCENDS determines if an integer vector descends.\n' );

  for test = 1 : test_num

    x(1:n) = x_test(1:n,test);

    i4vec_print ( n, x, '  Test vector:' );

    fprintf ( 1, '  I4VEC_DESCENDS = %d\n', i4vec_descends ( n, x ) );

  end

  return
end
