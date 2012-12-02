function prob_test1341 ( )

%*****************************************************************************80
%
%% TEST01341 checks RIBESL against BESSEL_IX_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1341:\n' );
  fprintf ( 1, '  RIBESL computes values of Bessel functions\n' );
  fprintf ( 1, '  of NONINTEGER order.\n' );
  fprintf ( 1, '  BESSEL_IX_VALUES returns selected values of the\n' );
  fprintf ( 1, '  Bessel function In for NONINTEGER order.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '      ALPHA         X             FX                        FX2\n' );
  fprintf ( 1, ...
    '                                  (table)                   (RIBESL)\n' );
  fprintf ( 1, '\n' );
  n_data = 0;

  while ( 1 )

    [ n_data, alpha, x, fx ] = bessel_ix_values ( n_data );

    if ( n_data == 0 );
      break
    end

    ize = 1;
    nb = floor ( alpha ) + 1;
    alpha_frac = alpha - floor ( alpha );

    [ b, ncalc ] = ribesl ( x, alpha_frac, nb, ize );
    fx2 = b(nb);

    fprintf ( 1, '  %12f  %12f  %24.16e  %24.16e\n', alpha, x, fx, fx2 );

  end

  return
end
