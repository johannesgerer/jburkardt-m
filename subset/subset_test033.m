function subset_test033 ( )

%*****************************************************************************80
%
%% TEST033 tests I4_SQRT.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST033\n' );
  fprintf ( 1, '  I4_SQRT computes the square root of an integer.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       N  Sqrt(N) Remainder\n' );
  fprintf ( 1, '\n' );

  for n = -5 : 20

    [ q, r ] = i4_sqrt ( n );
    fprintf ( 1, '  %7d  %7d  %7d\n', n, q, r );

  end

  return
end
