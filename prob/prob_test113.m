function prob_test113 ( )

%*****************************************************************************80
%
%% TEST113 tests NAKAGAMI_CDF, NAKAGAMI_PDF.
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
  fprintf ( 1, 'TEST113\n' );
  fprintf ( 1, '  For the Nakagami PDF:\n' );
  fprintf ( 1, '  NAKAGAMI_CDF evaluates the CDF;\n' );
  fprintf ( 1, '  NAKAGAMI_PDF evaluates the PDF;\n' );

  x = 1.25;

  a = 1.0;
  b = 2.0;
  c = 3.0;

  check = nakagami_check ( a, b, c );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST113 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  pdf = nakagami_pdf ( x, a, b, c );

  cdf = nakagami_cdf ( x, a, b, c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF argument X =              %14f\n', x );
  fprintf ( 1, '  PDF parameter A =             %14f\n', a );
  fprintf ( 1, '  PDF parameter B =             %14f\n', b );
  fprintf ( 1, '  PDF parameter C =             %14f\n', c );
  fprintf ( 1, '  PDF value =                   %14f\n', pdf );
  fprintf ( 1, '  CDF value =                   %14f\n', cdf );

  return
end
