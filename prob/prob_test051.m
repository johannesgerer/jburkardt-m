function prob_test051 ( )

%*****************************************************************************80
%
%% TEST051 tests BETA_PDF, DIRICHLET_PDF.
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
  n = 2;
  xval = 0.25;
  aval = 2.50;
  bval = 3.50;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST051\n' );
  fprintf ( 1, '  BETA_PDF evaluates the Beta PDF.\n' );
  fprintf ( 1, '  DIRICHLET_PDF evaluates the Dirichlet PDF.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For N = 2, Dirichlet = Beta.\n' );

  xvec(1:2) = [ xval, 1.0 - xval ];

  avec(1:2) = [ aval, bval ];

  check = dirichlet_check ( n, avec );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST051 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of components N =        %6d\n', n );
  fprintf ( 1, '  PDF arguments X(1:N):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %14f\n', i, xvec(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameters A(1:N):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %14f\n', i, avec(i) );
  end

  pdf = dirichlet_pdf ( xvec, n, avec );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Dirichlet PDF value =  %14f\n', pdf );

  x = xval;

  a = aval;
  b = bval;

  pdf = beta_pdf ( x, a, b );

  fprintf ( 1, '  Beta PDF value = %14f\n', pdf );

  return
end
