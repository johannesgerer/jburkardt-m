function prob_test112 ( )

%*****************************************************************************80
%
%% TEST112 tests MULTINOMIAL_PDF.
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
  b = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST112\n' );
  fprintf ( 1, '  For the Multinomial PDF:\n' );
  fprintf ( 1, '  MULTINOMIAL_PDF evaluates the PDF.\n' );

  x(1:3) = [ 0, 2, 3 ];

  a = 5;

  c(1:3) = [ 0.10, 0.50, 0.40 ];

  check = multinomial_check ( a, b, c );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST112 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF argument X:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : b
    fprintf ( 1, '  %6d\n', x(i) );
  end
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '  PDF parameter B = %14f\n', b );
  fprintf ( 1, '  PDF parameter C = \n' );
  for i = 1 : b
    fprintf ( 1, '  %14f\n', c(i) );
  end

  pdf = multinomial_pdf ( x, a, b, c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF value =     %14f\n', pdf );

  return
end
