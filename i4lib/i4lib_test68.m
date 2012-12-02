function i4lib_test68 ( )

%*****************************************************************************80
%
%% TEST68 tests I4VEC_PAIRWISE_PRIME.
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
%  Each ROW of the definition is a COLUMN of the matrix.
%
  x_test = [ ...
     1,  3,  2,  4; ...
     2,  2,  2,  2; ...
     5,  7, 12, 29; ...
     1, 13,  1, 11; ...
     1,  4,  9, 16; ...
     6, 35, 13, 77 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST68\n' );
  fprintf ( 1, '  I4VEC_PAIRWISE_PRIME determines if a vector of\n' );
  fprintf ( 1, '  integers is pairwise prime.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '              Pairwise\n' );
  fprintf ( 1, '  Row Vector     Prime?\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    x(1:n) = x_test(1:n,test);

    fprintf ( 1, '  %3d  %3d  %3d  %3d  %1d\n', ...
      x(1:n), i4vec_pairwise_prime ( n, x ) );

  end

  return
end
