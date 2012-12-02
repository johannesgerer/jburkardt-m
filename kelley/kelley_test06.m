%% TEST06 tests NSOL on the Chandrasekhar function.
%
%  Modified:
%
%    23 June 2007
%
%  Author:
%
%    John Burkardt
%
  clear

  n = 100;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  Test NSOL on the Chandrasekhar function.\n' );
%
%  Initial estimate.
%
  h(1:n,1) = 1.0;

  tol(1) = 0.000001;
  tol(2) = 0.000001;

  parms(1) = 10;
  parms(2) = 1;
  parms(3) = 0.0;

  [ sol, it_hist, ierr ] = nsol ( h, @chandrasekhar, tol, parms );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Error flag IERR = %d\n', ierr );

  f = chandrasekhar ( sol );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Residual norm: %f\n', norm ( f ) );

  it_hist

