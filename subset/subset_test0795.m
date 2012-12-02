function test0795 ( )

%*****************************************************************************80
%
%% TEST0795 tests MONOMIAL_COUNT and MONOMIAL_COUNTS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2008
%
%  Author:
%
%    John Burkardt
%
  degree_max = 9;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0795\n' );
  fprintf ( 1, '  MONOMIAL_COUNT counts the number of monomials of\n' );
  fprintf ( 1, '  degrees 0 through DEGREE_MAX in a space of dimension DIM.\n' );
  fprintf ( 1, '  MONOMIAL_COUNTS provides individual counts.\n' );

  for dim = 1 : 6

    counts = monomial_counts ( degree_max, dim );
    total = monomial_count ( degree_max, dim );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  DIM = %d\n', dim );
    fprintf ( 1, '\n' );
    for degree = 0 : degree_max
      fprintf ( 1, '  %8d  %8d\n', degree, counts(degree+1) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '     Total  %8d  %8d\n', ...
      sum ( counts(1:degree_max+1) ), total );

  end

  return
end
