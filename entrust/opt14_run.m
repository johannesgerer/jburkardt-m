%% OPT14_RUN
%
%  Modified:
%
%    08 January 2008
%
   %---------------------------------------------------------------------
   %  Nonlinear Equation Example
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_14:  exact solutions (, )\n')
   fprintf('---------------------------------------------------------\n')
   fname = 'opt14_fgh';
   options = [];
   options.verbose            = 0;
   options.max_iterations     = 180;
   options.max_fevals         = 180;
   options.method             = 'newton';
   
   fprintf('Newton:\n')
   options.globalization      = 'trust_region';

   x0 = [ -.8; .8; -.8 ];
   x = entrust(fname, x0, options);
   fprintf('Newtons method produced  (%10.7e,%10.7e,%10.7e)\n\n',x(1),x(2),x(3))
   f = opt14_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );

   x0 = [ 2; -1; 1 ];
   x = entrust(fname, x0, options);
   fprintf('Newtons method produced  (%10.7e,%10.7e,%10.7e)\n\n',x(1),x(2),x(3))
   f = opt14_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );

   %---------------------------------------------------------------------
   %  Test Gauss-Newton strategies.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_14 as least squares problem: \n')
   fprintf('Exact solution (,)\n')
   fprintf('---------------------------------------------------------\n')
   fname = 'opt14_rj';
   options = [];
   options.verbose            = 0;
   options.method             = 'gauss_newton';
   options.step_tolerance     = 1.e-15;
   options.globalization      = 'none';
   options.gradient_tolerance = 1.e-10;
   options.max_iterations     = 450;

   x0 = [ -.8; .8; -.8 ];
   x = entrust(fname, x0, options);
   fprintf('Gauss-Newton produced  (%10.7e, %10.7e, %10.7e)\n\n',x(1),x(2),x(3))
   [ res, jac ] = opt14_rj ( x, 'f' );
   fprintf('Norm of RES(X) = %f\n', norm ( res ) );

   x0 = [ 2; -1; 1 ];
   x = entrust(fname, x0, options);
   fprintf('Gauss-Newton produced  (%10.7e, %10.7e, %10.7e)\n\n',x(1),x(2),x(3))
   [ res, jac ] = opt14_rj ( x, 'f' );
   fprintf('Norm of RES(X) = %f\n', norm ( res ) );
