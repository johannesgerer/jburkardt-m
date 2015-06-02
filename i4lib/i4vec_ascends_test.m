function i4vec_ascends_test ( )

%*****************************************************************************80
%
%% I4VEC_ASCENDS_TEST tests I4VEC_ASCENDS.
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
  fprintf ( 1, 'I4VEC_ASCENDS_TEST\n' );
  fprintf ( 1, '  I4VEC_ASCENDS determines if an integer vector ascends.\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    x(1:n) = x_test(1:n,test);

    i4vec_print ( n, x, '  Test vector:' );

    fprintf ( 1, '  I4VEC_ASCENDS =  %d\n', i4vec_ascends ( n, x ) );

  end

  return
end
