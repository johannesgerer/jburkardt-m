function combo_test04 ( )

%*****************************************************************************80
%
%% COMBO_TEST04 tests BINOMIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMBO_TEST04\n' );
  fprintf ( 1, '  BINOMIAL computes binomial coefficients.\n' );

  for i = -1 : 5
    for j = -1 : 5
      fprintf ( 1, '  %6d  %6d  %6d\n', i, j, binomial ( i, j ) );
    end
  end

  return
end
