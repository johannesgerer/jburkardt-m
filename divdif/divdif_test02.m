function divdif_test02 ( )

%*****************************************************************************80
%
%% DIVDIF_TEST02 tests DATA_TO_DIF and DIF_VAL.
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
  maxtab = 8;
  xval = 2.5;
  exact = exp ( xval );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DIVDIF_TEST02\n' );
  fprintf ( 1, '  Approximate Y = EXP(X) using orders 1 to %d\n', maxtab );
  fprintf ( 1, '  Evaluate at X = %f\n', xval );
  fprintf ( 1, '  where EXP(X)=   %f\n', exact );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Order  Approximate Y     Error\n' );
  fprintf ( 1, '\n' );

  for ntab = 1 : maxtab

    for j = 1 : ntab
      xtab(j) = j - 1;
      ytab(j) = exp ( xtab(j) );
    end

    diftab = data_to_dif ( ntab, xtab, ytab );

    yval = dif_val ( ntab, xtab, diftab, xval );

    err = yval - exact;
    fprintf ( 1, '  %6d  %14f  %14f\n', ntab, yval, err );

  end

  return
end
