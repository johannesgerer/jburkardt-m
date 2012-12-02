function polpak_test0665 ( )

%*****************************************************************************80
%
%% TEST0665 tests POLY_BERNOULLI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0665\n' );
  fprintf ( 1, '  POLY_BERNOULLI computes the poly-Bernoulli numbers\n' );
  fprintf ( 1, '  of negative index, B_n^(-k)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N   K    B_N^(-K)\n' );
  fprintf ( 1, '\n' );

  for k = 0 : 6

    fprintf ( 1, '\n' );

    for n = 0 : 6

      b = poly_bernoulli ( n, k );

      fprintf ( 1, '  %2d  %2d  %12d\n', n, k, b );

    end
  end

  return
end
