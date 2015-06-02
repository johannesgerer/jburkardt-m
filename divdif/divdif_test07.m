function divdif_test07 ( )

%*****************************************************************************80
%
%% DIVDIF_TEST07 tests R8POLY_BASIS.
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
  fprintf ( 1, 'DIVDIF_TEST07\n' );
  fprintf ( 1, '  R8POLY_BASIS computes Lagrange basis polynomials\n' );
  fprintf ( 1, '  in standard form.\n' );
  fprintf ( 1, '\n' );
%
%  Set the base points.
%
  xtab = r8vec_indicator ( ntab );
%
%  Get the difference tables for the basis polynomials and print them.
%
  polcof = r8poly_basis ( ntab, xtab );

  for i = 1 : ntab
    fprintf ( 1, '  ' );
    for j = 1 : ntab
      fprintf ( 1, '%14f', polcof(i,j) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Print basis polynomial 3 in polynomial form.
%
  r8poly_print ( ntab, polcof(1:ntab,3), ...
    '  Basis polynomial 3 in standard form:' );
%
%  Evaluate basis polynoimial 3 at a set of points.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Evaluate basis polynomial 3 at a set of points.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X        Y\n' );
  fprintf ( 1, '\n' );
  xhi =  ntab;
  xlo = 1.0;

  for i = 1 : nstep

    xval = ( ( nstep - i     ) * xlo   ...
           + (         i - 1 ) * xhi ) ...
           / ( nstep     - 1 );

    yval = r8poly_val_horner ( ntab, polcof(1:ntab,3), xval );

    fprintf ( 1, '  %14f  %14f\n', xval, yval );

  end

  return
end
