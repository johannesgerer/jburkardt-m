function prob_test123 ( )

%*****************************************************************************80
%
%% TEST123 tests PEARSON_05_PDF.
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
  fprintf ( 1, 'TEST123\n' );
  fprintf ( 1, '  For the Pearson 05 PDF:\n' );
  fprintf ( 1, '  PEARSON_05_PDF evaluates the PDF.\n' );

  x = 5.0;

  a = 1.0;
  b = 2.0;
  c = 3.0;

  check = pearson_05_check ( a, b, c );
 
  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST123 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  pdf = pearson_05_pdf ( x, a, b, c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF argument X =  %14f\n', x );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '  PDF parameter B = %14f\n', b );
  fprintf ( 1, '  PDF parameter C = %14f\n', c );
  fprintf ( 1, '  PDF value =       %14f\n', pdf );

  return
end
