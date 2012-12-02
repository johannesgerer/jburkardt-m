function asa047_test04 ( )

%*****************************************************************************80
%
%% ASA047_TEST04 demonstrates the use of NELMIN on QUARTIC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2011
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA047_TEST04\n' );
  fprintf ( 1, '  Apply NELMIN to the QUARTIC function.\n' );

  start(1:n) = 1.0;
  reqmin = 1.0E-08;
  step(1:n) = 1.0;
  konvge = 10;
  kcount = 500;

  fprintf ( 1, '\n' );
  fprintf ( 1,'  Starting point X:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %f\n', start(i) );
  end

  ynewlo = quartic ( start );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X) = %f\n', ynewlo );

  [ xmin, ynewlo, icount, numres, ifault ] = nelmin ( @quartic, n, start, ...
  reqmin, step, konvge, kcount );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Return code IFAULT = %d\n', ifault );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate of minimizing value X*:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %f\n', xmin(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %f\n', ynewlo );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of iterations = %d\n', icount );
  fprintf ( 1, '  Number of restarts =   %d\n', numres );

  return
end
