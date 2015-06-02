function comb_row_next_test ( )

%*****************************************************************************80
%
%% COMB_ROW_NEXT_TEST tests COMB_ROW_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 December 2014
%
%  Author:
%
%    John Burkardt
%
  n_max = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMB_ROW_NEXT_TEST\n' );
  fprintf ( 1, '  COMB_ROW_NEXT computes the next row of Pascal''s triangle.\n' );
  fprintf ( 1, '\n' );
  
  c = zeros ( n_max + 1, 1 );
  for n = 0 : n_max
    c = comb_row_next ( n, c );
    fprintf ( 1, '  %2d  ', n );
    for i = 0 : n
      fprintf ( 1, '  %3d', c(i+1) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
