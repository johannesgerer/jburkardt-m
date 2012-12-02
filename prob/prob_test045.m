function prob_test045 ( )

%*****************************************************************************80
%
%% TEST045 tests DIPOLE_CDF, DIPOLE_CDF_INV, DIPOLE_PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2009
%
%  Author:
%
%    John Burkardt
%
  ntest = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST045\n' );
  fprintf ( 1, '  For the Dipole PDF:\n' );
  fprintf ( 1, '  DIPOLE_CDF evaluates the CDF.\n' );
  fprintf ( 1, '  DIPOLE_CDF_INV inverts the CDF.\n' );
  fprintf ( 1, '  DIPOLE_PDF evaluates the PDF.\n' );

  atest(1:3) = [ 0.0, pi / 4.0, pi / 2.0 ];
  btest(1:3) = [ 1.0, 0.5, 0.0 ];

  for itest = 1 : ntest

    a = atest(itest);
    b = btest(itest);

    check = dipole_check ( a, b );

    if ( ~check );
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TEST045 - Fatal error!\n' );
      fprintf ( 1, '  The parameters are not legal.\n' );
      return
    end
  
    fprintf ( 1, '\n' );
    fprintf ( 1, '  PDF parameter A = %14f\n', a );
    fprintf ( 1, '  PDF parameter B = %14f\n', b );

    seed = 123456789;

    fprintf ( 1, '\n' );
    fprintf ( 1, '       X            PDF           CDF            CDF_INV\n' );
    fprintf ( 1, '\n' );

    for i = 1 : 10

      [ x, seed ] = dipole_sample ( a, b, seed );

      pdf = dipole_pdf ( x, a, b );

      cdf = dipole_cdf ( x, a, b );

      x2 = dipole_cdf_inv ( cdf, a, b );

      fprintf ( 1, ' %14f  %14f  %14f  %14f\n', x, pdf, cdf, x2 );

    end

  end

  return
end
