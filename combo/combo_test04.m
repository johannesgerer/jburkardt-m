function combo_test04 ( )

%*****************************************************************************80
%
%% COMBO_TEST04 tests I4_CHOOSE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 December 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMBO_TEST04\n' );
  fprintf ( 1, '  I4_CHOOSE computes binomial coefficients.\n' );

  for i = -1 : 5
    for j = -1 : 5
      fprintf ( 1, '  %6d  %6d  %6d\n', i, j, i4_choose ( i, j ) );
    end
  end

  return
end
