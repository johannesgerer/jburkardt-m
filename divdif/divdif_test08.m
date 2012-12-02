function divdif_test08 ( )

%*****************************************************************************80
%
%% DIVDIF_TEST08 tests NCO_RULE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 June 2011
%
%  Author:
%
%    John Burkardt
%
  norder = 8;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIVDIF_TEST08\n' );
  fprintf ( 1, '  NCO_RULE computes open Newton Cotes formulas.\n' );
  fprintf ( 1, '\n' );

  [ xtab, weight ] = nco_rule ( norder );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Newton-Cotes Open Quadrature Rule:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      Abscissa       Weight\n' );
  fprintf ( 1, '\n' );

  for i = 1 : norder
    fprintf ( 1, '  %3d  %14f  %14f\n', i, xtab(i), weight(i) );
  end

  return
end
