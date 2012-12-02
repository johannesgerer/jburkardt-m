function polpak_test024 ( )

%*****************************************************************************80
%
%% TEST024 tests COMB_ROW.
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
  fprintf ( 1, 'TEST024\n' );
  fprintf ( 1, '  COMB_ROW computes a row of Pascal''s triangle.\n' );
  fprintf ( 1, '\n' );
 
  ido = 0;
 
  for i = 0 : n
    c = comb_row ( ido, i );
    ido = 1;
    fprintf ( 1, '  %2d  ', i );
    for j = 0 : i
      fprintf ( 1, '  %3d', c(j+1) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
