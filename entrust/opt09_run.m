%% OPT09_RUN
%
%  Modified:
%
%    08 January 2008
%
   %---------------------------------------------------------------------
   %  Running the trigonometric function
   %  This is used to test globalization methods.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_9:  F(X*) = 0\n')
   fprintf('---------------------------------------------------------\n')
   fname = 'opt09_fgh';
   options = [];
   options.verbose            = 0;
   options.method             = 'newton';
   
   fprintf('Newton:\n')
   options.globalization      = 'line_search';
   x0 = [ .25; .25; .25; .25 ];
   x = entrust(fname, x0, options);
   fprintf('Line search produced  (%8.5e,%8.5e,%8.5e,%8.5e)\n\n',...
     x(1),x(2),x(3),x(4))
   f = opt09_fgh ( x, 'f' );

   fprintf('Value of F(X) = %f\n', f );
   fprintf('Newton:\n')
   options.globalization      = 'trust_region';
   x = entrust(fname, x0, options);
   fprintf('Trust-region produced (%8.5e,%8.5e,%8.5e,%8.5e)\n\n',...
     x(1),x(2),x(3),x(4))
   f = opt09_fgh ( x, 'f' );
   fprintf('Value of F(X) = %f\n', f );

   %---------------------------------------------------------------------
   %  Test Gauss-Newton strategies.
   %---------------------------------------------------------------------
   fprintf('---------------------------------------------------------\n')
   fprintf('Running testcase_9 as least squares problem: \n')
   fprintf(' ||RES(X*)|| = 0\n')
   fprintf('---------------------------------------------------------\n')
   fname = 'opt09_rj';
   options = [];
   options.verbose            = 0;
   options.method             = 'gauss_newton';
   options.step_tolerance     = 1.e-15;
   options.globalization      = 'none';
   options.gradient_tolerance = 1.e-10;
   options.max_iterations     = 800;

   x0 = [ .25; .25; .25; .25 ];
   x = entrust(fname, x0, options);

   fprintf('Gauss-Newton produced (%8.5e,%8.5e,%8.5e,%8.5e)\n\n',...
     x(1),x(2),x(3),x(4))
   [ res, jac ] = opt09_rj ( x, 'f' );
   fprintf('Norm of RES(X) = %f\n', norm ( res ) );

