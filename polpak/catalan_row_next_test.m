function catalan_row_next_test ( )

%*****************************************************************************80
%
%% CATALAN_ROW_NEXT_TEST tests CATALAN_ROW_NEXT.
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
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CATALAN_ROW_NEXT_TEST\n' );
  fprintf ( 1, '  CATALAN_ROW_NEXT computes a row of Catalan''s triangle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  First, compute row 7:\n' );

  ido = 0;
  i = 7;
  c = [];
  c = catalan_row_next ( ido, i, c );
  fprintf ( 1, '  %2d  ', i );
  for j = 0 : i
    fprintf ( 1, '  %4d', c(j+1) );
  end
  fprintf ( 1, '\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now compute rows one at a time:\n' );
  fprintf ( 1, '\n' );

  ido = 0;
  c = [];
  
  for i = 0 : n
    c = catalan_row_next ( ido, i, c );
    ido = 1;
    fprintf ( 1, '  %2d  ', i );
    for j = 0 : i
      fprintf ( 1, '  %4d', c(j+1) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
