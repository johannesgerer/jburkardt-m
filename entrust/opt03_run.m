%% OPT03_RUN
%
%  Discussion:
%
%    This problem includes a parameter P that the user must set
%    in order to complete the definition of the problem.
%
%    Except when P = 8, the minimized value of F is nonzero.  This
%    can cause problems for the Gauss-Newton method.
%
%  Modified:
%
%    10 January 2008
%
%---------------------------------------------------------------------
%  Running testcase, from D+S, pp. 225-6, 231; 
%---------------------------------------------------------------------

  fprintf('---------------------------------------------------------\n')
  fprintf('NEWTON applied to F,G,H optimization system:\n')

  fname = 'opt03_fgh';
  options = [];
  options.verbose            = 0;
  options.method             = 'newton';
  options.step_tolerance     = 1.e-15;
  options.globalization      = 'none';
  options.gradient_tolerance = 1.e-10;
  options.max_iterations     = 40;
%
%  This run should require about 7 iterations.
%
  fprintf('---------------------------------------------------------\n')
  fprintf ( '\n' );
  p = 8;
  x0 = [1];
  fprintf ( '  Start X0 = %f\n', x0 );
  fprintf ( '  Parameter P = %f\n', p );
  fprintf('Newton:\n')
  x = entrust ( fname, x0, options, p );
  fprintf('Newton produced  (%10.7e)\n',x(1))
  f = opt03_fgh ( x, 'f', p );
  fprintf('Value of F(X) = %f\n', f );
%
%  This run should require about 9 iterations.
%
  fprintf('---------------------------------------------------------\n')
  fprintf ( '\n' );
  p = 3;
  x0 = [1];
  fprintf ( '  Start X0 = %f\n', x0 );
  fprintf ( '  Parameter P = %f\n', p );
  fprintf('Newton:\n')
  x = entrust ( fname, x0, options, p );
  fprintf('Newton produced  (%10.7e)\n',x(1))
  f = opt03_fgh ( x, 'f', p );
  fprintf('Value of F(X) = %f\n', f );
%
%  This run should require about 10 iterations.
%
  fprintf('---------------------------------------------------------\n')
  fprintf ( '\n' );
  p = -1;
  x0 = [1];
  fprintf ( '  Start X0 = %f\n', x0 );
  fprintf ( '  Parameter P = %f\n', p );
  fprintf('Newton:\n')
  x = entrust ( fname, x0, options, p );
  fprintf('Newton produced  (%10.7e)\n',x(1))
  f = opt03_fgh ( x, 'f', p );
  fprintf('Value of F(X) = %f\n', f );
%
%  This run should require about 12 iterations.
%
  fprintf('---------------------------------------------------------\n')
  fprintf ( '\n' );
  p = -4;
  x0 = [1];
  fprintf ( '  Start X0 = %f\n', x0 );
  fprintf ( '  Parameter P = %f\n', p );
  fprintf('Newton:\n')
  x = entrust ( fname, x0, options, p );
  fprintf('Newton produced  (%10.7e)\n',x(1))
  f = opt03_fgh ( x, 'f', p );
  fprintf('Value of F(X) = %f\n', f );
%
%  This run should require about 12 iterations.
%
  fprintf('---------------------------------------------------------\n')
  fprintf ( '\n' );
  p = -8;
  x0 = [1];
  fprintf ( '  Start X0 = %f\n', x0 );
  fprintf ( '  Parameter P = %f\n', p );
  fprintf('Newton:\n')
  x = entrust ( fname, x0, options, p );
  fprintf('Newton produced  (%10.7e)\n',x(1))
  f = opt03_fgh ( x, 'f', p );
  fprintf('Value of F(X) = %f\n', f );
%
%  This run should require about 5 iterations.
%
  fprintf('---------------------------------------------------------\n')
  fprintf ( '\n' );
  p = 3;
  x0 = [.5];
  fprintf ( '  Start X0 = %f\n', x0 );
  fprintf ( '  Parameter P = %f\n', p );
  fprintf('Newton:\n')
  x = entrust ( fname, x0, options, p );
  fprintf('Newton produced  (%10.7e)\n',x(1))
  f = opt03_fgh ( x, 'f', p );
  fprintf('Value of F(X) = %f\n', f );

%---------------------------------------------------------------------
%  Running testcase, from D+S, pp. 225-6, 231;
%  This is used to test Gauss-Newton strategies.
%---------------------------------------------------------------------
  fprintf('---------------------------------------------------------\n')
  fprintf('Gauss-Newton applied to RES, JAC nonlinear least squares system: \n')

  fname = 'opt03_rj';
  options = [];
  options.verbose            = 0;
  options.method             = 'gauss_newton';
  options.step_tolerance     = 1.e-15;
  options.globalization      = 'none';
  options.gradient_tolerance = 1.e-10;
  options.max_iterations     = 40;
%
%  This run should require about 12 iterations.
%
  fprintf('---------------------------------------------------------\n')
  fprintf ( '\n' );
  p = 8;
  x0 = [1];
  fprintf ( '  Start X0 = %f\n', x0 );
  fprintf ( '  Parameter P = %f\n', p );
  fprintf('Gauss Newton:\n')
  x = entrust ( fname, x0, options, p );
  fprintf('Gauss-Newton produced  (%10.7e)\n',x(1))
  [ res, jac ] = opt03_rj ( x, 'f', p );
  fprintf('Norm of RES(X) = %f\n', norm ( res ) );
%
%  This run should require about 12 iterations.
%
  fprintf('---------------------------------------------------------\n')
  fprintf ( '\n' );
  p = 3;
  x0 = [1];
  fprintf ( '  Start X0 = %f\n', x0 );
  fprintf ( '  Parameter P = %f\n', p );
  fprintf('Gauss Newton:\n')
  x = entrust ( fname, x0, options, p );
  fprintf('Gauss-Newton produced  (%10.7e)\n',x(1))
  [ res, jac ] = opt03_rj ( x, 'f', p );
  fprintf('Norm of RES(X) = %f\n', norm ( res ) );
%
%  This run should not converge
%
  fprintf('---------------------------------------------------------\n')
  fprintf ( '\n' );
  p = -1;
  x0 = [1];
  fprintf ( '  Start X0 = %f\n', x0 );
  fprintf ( '  Parameter P = %f\n', p );
  fprintf('Gauss Newton:\n')
  x = entrust ( fname, x0, options, p );
  fprintf('Gauss-Newton produced  (%10.7e)\n',x(1))
  [ res, jac ] = opt03_rj ( x, 'f', p );
  fprintf('Norm of RES(X) = %f\n', norm ( res ) );
%
%  This run should not converge.
%
  fprintf('---------------------------------------------------------\n')
  fprintf ( '\n' );
  p = -4;
  x0 = [1];
  fprintf ( '  Start X0 = %f\n', x0 );
  fprintf ( '  Parameter P = %f\n', p );
  fprintf('Gauss Newton:\n')
  x = entrust ( fname, x0, options, p );
  fprintf('Gauss-Newton produced  (%10.7e)\n',x(1))
  [ res, jac ] = opt03_rj ( x, 'f', p );
  fprintf('Norm of RES(X) = %f\n', norm ( res ) );
%
%  This run should not converge.
%
  fprintf('---------------------------------------------------------\n')
  fprintf ( '\n' );
  p = -8;
  x0 = [1];
  fprintf ( '  Start X0 = %f\n', x0 );
  fprintf ( '  Parameter P = %f\n', p );
  fprintf('Gauss Newton:\n')
  x = entrust ( fname, x0, options, p );
  fprintf('Gauss-Newton produced  (%10.7e)\n',x(1))
  [ res, jac ] = opt03_rj ( x, 'f', p );
  fprintf('Norm of RES(X) = %f\n', norm ( res ) );
%
%  This run should require about 9 steps.
%
  fprintf('---------------------------------------------------------\n')
  fprintf ( '\n' );
  p = 3;
  x0 = [.5];
  fprintf ( '  Start X0 = %f\n', x0 );
  fprintf ( '  Parameter P = %f\n', p );
  fprintf('Gauss Newton:\n')
  x = entrust ( fname, x0, options, p );
  fprintf('Gauss-Newton produced  (%10.7e)\n',x(1))
  [ res, jac ] = opt03_rj ( x, 'f', p );
  fprintf('Norm of RES(X) = %f\n', norm ( res ) );
