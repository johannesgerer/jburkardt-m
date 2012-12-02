function subset_test012 ( )

%*****************************************************************************80
%
%% TEST012 tests COMB_ROW.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 August 2008
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST012\n' );
  fprintf ( 1, '  COMB_ROW computes a row of Pascal''s triangle.\n' );
  fprintf ( 1, '\n' );
 
  ido = 0;
 
  for i = 0 : n
    c = comb_row ( ido, i );
    ido = 1;
    fprintf ( 1, '  %2d', i )
    for j = 1 : i+1
      fprintf ( 1, '  %5d', c(j) );
    end
    fprintf ( 1, '\n' );
  end
 
  return
end
