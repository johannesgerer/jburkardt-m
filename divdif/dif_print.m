function dif_print ( ntab, xtab, diftab, title )

%*****************************************************************************80
%
%% DIF_PRINT prints the polynomial represented by a divided difference table.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NTAB, the dimension of the arrays DIFTAB and XTAB.
%
%    Input, real XTAB(NTAB), the X values for the polynomial.
%
%    Input, real DIFTAB(NTAB), the divided difference table
%    for the polynomial.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  p(x) =                           %14f\n', diftab(1) );

  for i = 2 : ntab
    fprintf ( 1, '       + ( x - %14f) * ( %14f\n', xtab(i-1), diftab(i) );
  end

  fprintf ( 1, '  ' );
  for i = 1 : ntab-1
    fprintf ( 1, ')' );
  end
  fprintf ( 1, '\n' );

  return
end
