function prob_test124 ( )

%*****************************************************************************80
%
%% TEST124 tests PLANCK_PDF.
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
  fprintf ( 1, 'TEST124\n' );
  fprintf ( 1, '  For the Planck PDF:\n' );
  fprintf ( 1, '  PLANCK_PDF evaluates the PDF.\n' );

  a = 2.0;
  b = 3.0;

  if ( ~planck_check ( a, b ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST124 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %f\n', a );
  fprintf ( 1, '  PDF parameter B = %f\n', b );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = planck_sample ( a, b, seed );

    pdf = planck_pdf ( x, a, b );

    fprintf ( 1, '  %12f  %12f\n', x, pdf );

  end

  return
end
