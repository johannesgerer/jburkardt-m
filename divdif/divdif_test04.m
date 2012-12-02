function divdif_test04 ( )

%*****************************************************************************80
%
%% DIVDIF_TEST04 tests DIF_BASIS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2006
%
%  Author:
%
%    John Burkardt
%
  ntab = 5;
  nstep = 9;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIVDIF_TEST04\n' );
  fprintf ( 1, '  DIF_BASIS computes Lagrange basis polynomials\n' );
  fprintf ( 1, '  in difference form.\n' );
  fprintf ( 1, '\n' );
%
%  Set the base points.
%
  xtab = r8vec_indicator ( ntab );

  r8vec_print ( ntab, xtab, '  The base points:' );
%
%  Get the difference tables for the basis polynomials and print them.
%
  diftab = dif_basis ( ntab, xtab );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The table of difference vectors defining the basis\n' );
  fprintf ( 1, '  polynomials.  Each column represents a polynomial.\n' );
  fprintf ( 1, '\n' );
  for i = 1 : ntab
    fprintf ( 1, '  ' );
    for j = 1 : ntab
      fprintf ( 1, '%14f', diftab(i,j) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Evaluate basis polynomial 3 at a set of points.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Evaluate basis polynomial #3 at a set of points.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X        Y\n' );
  fprintf ( 1, '\n' );
  xhi = ntab;
  xlo = 1.0;

  for i = 1 : nstep

    xval = ( ( nstep - i     ) * xlo   ...
           + (         i - 1 ) * xhi ) ...
           / ( nstep     - 1 );

    yval = dif_val ( ntab, xtab, diftab(1:ntab,3), xval );

    fprintf ( 1, '  %14f  %14f\n', xval, yval );

  end

  return
end
