function prob_test048 ( )

%*****************************************************************************80
%
%% TEST048 tests DIRICHLET_PDF.
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
  n = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST048\n' );
  fprintf ( 1, '  For the Dirichlet PDF:\n' );
  fprintf ( 1, '  DIRICHLET_PDF evaluates the PDF.\n' );

  x(1:3) = [ 0.500, 0.125, 0.375 ];

  a(1:3) = [ 0.250, 0.500, 1.250 ];

  check = dirichlet_check ( n, a );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST048 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of components N = %6d\n', n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF arguments X(1:N):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %14f\n', i, x(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameters A(1:N):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %14f\n', i, a(i) );
  end

  pdf = dirichlet_pdf ( x, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF value = %14f\n', pdf );

  return
end
