function asa310_test01 ( )

%*****************************************************************************80
%
%% TEST01 demonstrates the use of NCBETA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01:\n' );
  fprintf ( 1, '  NCBETA computes the noncentral incomplete beta function.\n' );
  fprintf ( 1, '  Compare to tabulated values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A       B   LAMBDA      X       ' );
  fprintf ( 1, 'FX                        FX2\n' );
  fprintf ( 1, '                                      ' );
  fprintf ( 1, '(Tabulated)              (NCBETA)                DIFF\n' );
  fprintf ( 1, '\n' );

  errmax = 1.0E-10;

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, lambda, x, fx ] = beta_noncentral_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    [ fx2, ifault ] = ncbeta ( a, b, lambda, x, errmax );

    fprintf ( 1, '  %6.2f  %6.2f  %6.2f  %6.2f  %24.16e  %24.16e  %10.4e\n', ...
    a, b, lambda, x, fx, fx2, abs ( fx - fx2 ) );

  end

  return
end
