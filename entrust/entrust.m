function x = entrust(fname, x, options, varargin)
%------------------------------------------------------------------------
%  entrust.m - a driver for an unconstrained optimization problem using
%              line search or trust-region globalization strategies and
%              several types of secant update strategies.  Box constraints
%              are incorporated in the trust-region algorithm.  Also 
%              includes the capability to handle nonlinear least-squares 
%              problems.
%
%  Copyright (c) 2000, Jeff Borggaard and Gene Cliff, Virginia Tech
%  Version: 0.2a
%
%  Usage:    x = entrust(fname, x, options, p0, p1, ...)
%
%  Variables:     x       
%                        Initial guess of the solution (dim: n_desvar)
%                        (used to store the current solution)
%                 fname   
%                        Name of a user supplied function to evaluate
%                        function, gradient, hessian, residual or 
%                        jacobian as required by the solution algorithm.
%                        ('interactive' will prompt the user for values)
%
%                 options - Structure that holds options
%                 -------
%                 .free_g
%                        Flag that determines whether or not the gradient
%                        is calculated simultaneously with f.
%                        (default: options.free_g = 1)
%                 .goal
%                        Goal of the problem, supported options include:
%                        'minimization' and 'maximization'
%                        (default: options.goal = 'minimization')
%                 .method
%                        Type of optimization method, supported options
%                        include:
%                        'newton', 'secant', 'steepest_descent',
%                        'gauss_newton', and 'structured_secant'
%                        (default: options.method = 'secant')
%                 .scale_x
%                        Vector of length (n_desvar) which contains
%                        typical values for the design parameters.
%                        (default: options.scale_x = ones(n_desvar,1))
%                 .scale_f
%                        A typical magnitude of the objective function.
%                        (default: options.scale_f = 1.0)
%                 .verbose
%                        Output flag
%                        0 - no output,  1 - print output
%                        (default: options.verbose = 1)
%                 .x_lower
%                        Lower bounds for the design variables
%                        (default: options.x_lower =-realmax)
%                 .x_upper
%                        Upper bounds for the design variables
%                        (default: options.x_upper = realmax)
%
%                     stopping criteria (specified as options variables)
%                     -----------------
%                 .gradient_tolerance
%                        Value of the gradient for which convergence is
%                        declared.
%                        (default: options.gradient_tolerance = 0.00001)
%                 .max_iterations
%                        Maximum number of main iterations in the 
%                        optimization.
%                        (default: options.max_iterations = 10)
%                 .max_fevals
%                        Maximum number of calls to 'fname'
%                        (default: options.max_fevals = 30)
%                 .step_tolerance
%                        Value of the change in parameter values for which
%                        convergence is declared.  May not occur at a
%                        local minimum.
%                        (default: options.step_tolerance = 0.00001)
%
%                     globalization criteria (also options)
%                     ----------------------
%                 .globalization
%                        Method used to perform globalization, supported
%                        options include:
%                        'line_search', 'trust_region' and 'none'
%                        (default: options.globalization = 'none')
%                 .max_step
%                        Maximum 'trust_region' radius or line search step
%                 .alpha (for 'line_search')
%                        (default: options.alpha = 0.0001, see D&S, p. 126)
%                 .tr_radius (for 'trust_region')
%                        Initial 'trust_region' radius
%                        (default: obtained through Cauchy step)
%
%                 p0, etc - user supplied parameters
%------------------------------------------------------------------------
   if ~ ( isa(fname, 'function_handle') | isa(fname, 'char') )
      fprintf('Input Error: first argument not a valid function handle')
      return
   end

   n_desvar = length(x);
   x        = reshape(x,[n_desvar,1]);

%  Set unspecified options to their default values
%  -----------------------------------------------
   if ( nargin < 3 ), options = [];, end
   [fname, options] = initialize(fname, options, n_desvar);

%  Compute the function/residual value (and additional information) 
%  ----------------------------------------------------------------
   f_count = 1;
   %  We may want to fold this into another function (fcn_eval)
   if strcmp( options.method,'newton' )
      [ f, g, H ] = feval(fname,x,'all',varargin{:}); 
      if ( options.goal(1:3) == 'max' )
         f =-f; g =-g; H =-H; 
      end
   end
   if strcmp( options.method,'secant' )
      [ f, g    ] = feval(fname,x,'all',varargin{:}); 
      if ( options.goal(1:3) == 'max' )
         f =-f; g =-g;
      end
   end
   if strcmp( options.method,'steepest_descent' )
      [ f, g    ] = feval(fname,x,'all',varargin{:}); 
      if ( options.goal(1:3) == 'max' )
         f =-f; g =-g;
      end
   end
   if strcmp( options.method,'gauss_newton' )
      [ r, jac  ] = feval(fname,x,'all',varargin{:});
      f = 0.5*r'*r;
      g = jac'*r; end

%  Initialize the Hessian
%  ----------------------
   % if strcmp( options.method,'newton' )
   % we assume it is given to be symmetric

   if strcmp( options.method,'secant' )
      if ( isfield(options,'initial_hessian') )
         H = options.initial_hessian;
	 %  make sure H is symmetric.
	 H = (H + H')/2;
      else
         H = max(abs(f),options.scale_f)*eye(n_desvar); end, end
   %  If necessary, we can compute an initial guess of the Hessian
   %  using finite differences of gradient calculations and take
   %  the symmetric part.

   if strcmp( options.method,'steepest_descent' )
      H = eye(n_desvar); end

   if strcmp( options.method,'gauss_newton' )
      H = jac'*jac; end


%  Write out initialization
%  ------------------------
   if ( options.verbose )
      fprintf('\n\n')
      fprintf(' -------------------------------------------------------\n');
      if ( isa(fname, 'function_handle') )
        fprintf(' %s of "%s" performed using %s.\n',...
               options.goal,func2str(fname),options.method)
      else
        fprintf(' %s of "%s" performed using %s.\n',...
               options.goal,fname,options.method) 
      end
      fprintf(' globalization is handled using %s.\n',options.globalization)
      fprintf(' stopping criteria are:\n')
      fprintf(' gradient < %e, step < %e,\n',...
               options.gradient_tolerance,options.step_tolerance)
      fprintf(' in addition, no more than %i iterations\n',...
               options.max_iterations)
      fprintf(' or %i function evaluations are permitted.\n',...
               options.max_fevals)
      fprintf(' -------------------------------------------------------\n\n');

      fprintf(' Initial Point:\n')
      fprintf(' -------------------------------------------------------\n');
      fprintf(' Design Variables: ')
      for i=1:n_desvar-1, fprintf(' %15.8e, ',x(i)); end
      fprintf(' %15.8e\n',x(n_desvar));
      if ( options.goal(1:3) == 'min' )
         fprintf(' Initial Function:  %15.8e\n',f);
      else
         fprintf(' Initial Function:  %15.8e\n',-f);
      end
      fprintf(' Norm of Gradient:  %15.8e\n\n', norm(g,2));
   end

%  Begin main optimization loop
   converged = 0;
   iteration = 0;

   f_plus = f;
   g_plus = g;
   H_plus = H;
   x_plus = x;

   while ( converged ~= 1 )
      iteration = iteration + 1;
      %  Compute the 'quasi-'Newton step
      newton_step = newton_solve(H,g);
                            % also compute the Cauchy step if steepest...

      %  Find appropriate optimization step using globalization procedure.

      %  None: Typically an unwise choice, this is included for
      %        academic purposes.
      if strcmp( options.globalization,'none' )
         x_plus = x + newton_step;
         f_count = f_count + 1;
         % This could be incorporated with another function
         if strcmp( options.method,'newton' )
            [ f_plus, g_plus, H_plus ] = feval(fname,x_plus,'all',varargin{:}); 
            if ( options.goal(1:3) == 'max' )
               f_plus =-f_plus; g_plus =-g_plus; H_plus =-H_plus;
            end
         end
         if strcmp( options.method,'secant' )
            [ f_plus, g_plus    ] = feval(fname,x_plus,'all',varargin{:});
            if ( options.goal(1:3) == 'max' )
               f_plus =-f_plus; g_plus =-g_plus;
            end
         end
         if strcmp( options.method,'steepest_descent' )
            [ f_plus, g_plus    ] = feval(fname,x_plus,'all',varargin{:});
            if ( options.goal(1:3) == 'max' )
               f_plus =-f_plus; g_plus =-g_plus;
            end
         end
         if strcmp( options.method,'gauss_newton' )
            [ r_plus, jac_plus  ] = feval(fname,x_plus,'all',varargin{:});
            f_plus = 0.5*r_plus'*r_plus;
            g_plus = jac_plus'*r_plus;
            H_plus = jac_plus'*jac_plus;
         end
      end

      %  We probably should incorporate the standard quadratic line
      %  search strategy here for the case where options.free_g = 0.
      
      %  Line Search: The philosophy here is that the gradient evaluations
      %               can be performed for a fraction of the cost of a 
      %               function evaluation, and these quantities are 
      %               computed simultaneously.  Thus, the line search is
      %               based on constructing a cubic model (using function
      %               values and gradients at the end points).  This is
      %               usually performed by a quadratic for the first
      %               backstep and a cubic for subsequent steps.
      if strcmp( options.globalization,'line_search' )
         alpha  = options.alpha;
         lambda = min( 1., options.max_step/max(norm(newton_step,2),1.) );
         valid  = 0;

         while (~valid)
            x_plus = x + lambda*newton_step;
            f_count = f_count + 1;
            % This could be incorporated with another function
            if strcmp( options.method,'newton' )
               [ f_plus, g_plus, H_plus ] = feval(fname,x_plus,'all',varargin{:});
               if ( options.goal(1:3) == 'max' )
                  f_plus =-f_plus; g_plus =-g_plus; H_plus =-H_plus;
               end
            end
            if strcmp( options.method,'secant' )
               [ f_plus, g_plus    ] = feval(fname,x_plus,'all',varargin{:});
               if ( options.goal(1:3) == 'max' )
                  f_plus =-f_plus; g_plus =-g_plus;
               end
            end
            if strcmp( options.method,'steepest_descent' )
               [ f_plus, g_plus    ] = feval(fname,x_plus,'all',varargin{:});
               if ( options.goal(1:3) == 'max' )
                  f_plus =-f_plus; g_plus =-g_plus;
               end
            end
            if strcmp( options.method,'gauss_newton' )
               [ r_plus, jac_plus  ] = feval(fname,x_plus,'all',varargin{:});
               f_plus = 0.5*r_plus'*r_plus;
               g_plus = jac_plus'*r_plus;
               H_plus = jac_plus'*jac_plus;
            end

            if ( f_plus > f + alpha*lambda*g'*newton_step )
               %  Use a backstepping algorithm with a cubic model.
               a = ( lambda*( g_plus'*newton_step - g'*newton_step) ...
                   - 2.*( f_plus - f - g'*newton_step*lambda ) ) / lambda^3;
               b = ( 3.*( f_plus - f - g'*newton_step*lambda ) - ...
                   lambda*( g_plus'*newton_step - g'*newton_step ) ) / lambda^2;
               if ( a == 0. ) 
                  %  Curve degenerates to a quadratic.
                  lambda =  max( -g'*newton_step/(2.*b), 0.1*lambda );
                  fprintf('Warning, curve degenerated to a quadratic\n\n');
               else
                  lambda1 = (-b + sqrt( b*b - 3*a*g'*newton_step ) ) / (3.*a);
                  lambda2 = (-b - sqrt( b*b - 3*a*g'*newton_step ) ) / (3.*a);
                  if ( lambda1 > 0. )
                     lambda = max( lambda1, 0.1*lambda );
                  else
                     lambda = max( lambda2, 0.1*lambda );
                  end
               end
            else
               valid = 1;
            end

            if ( f_count == options.max_fevals )
               valid = 1;
               if ( f_plus > f ) % we didn't find a better point
                  f_plus = f;
                  g_plus = g;
                  H_plus = H;
                  x_plus = x;
               end
            end

            if ( lambda*norm(newton_step) < options.step_tolerance )
               fprintf('lambda is too small when backstepping.\n\n')
               valid = 1;
               if ( f_plus > f ) % we didn't find a better point
                  f_plus = f;
                  g_plus = g;
                  H_plus = H;
                  x_plus = x;
               end
            end
         end
      end

      %  Trust-region algorithm:  The philosophy is that a function evaluation
      %                           is MUCH more expensive than any of the
      %                           matrix operations below.  If the number of
      %                           design variables becomes very large, we can
      %                           try to solve the trust-region subproblem
      %                           approximately.
      if strcmp( options.globalization,'trust_region' )
         if ( isfield(options,'tr_radius') ~= 1 )
            options.tr_radius = min( abs(g'*g/(g'*H*g)),options.max_step); end
         delta   = options.tr_radius;
         eta_1   = 0.1;
         eta_2   = 0.9;
         gamma_1 = 0.5;
         gamma_2 = 2.0;

         valid = 0;
         while ( valid ~= 1 )
            %  Solve the trust-region subproblem
            [s, val, lambda, active] = ...
                box_trust(g,H,delta,options.x_lower-x, ...
                                    options.x_upper-x,options);
            % [s,lambda] = tr_subproblem(g,H,delta,options);
            trial_point = x + s;

            f_count = f_count + 1;
            % This could be incorporated with another function
            if strcmp( options.method,'newton' )
               [ f_plus, g_plus, H_plus ] = ...
                    feval(fname,trial_point,'f',varargin{:});
               if ( options.goal(1:3) == 'max' & options.free_g == 1 )
                  f_plus =-f_plus; g_plus =-g_plus; H_plus =-H_plus;
               end
            end
            if strcmp( options.method,'secant' )
               [ f_plus, g_plus    ] = ...
                    feval(fname,trial_point,'f',varargin{:});
               if ( options.goal(1:3) == 'max' & options.free_g == 1 )
                  f_plus =-f_plus; g_plus =-g_plus;
               end
            end
            if strcmp( options.method,'steepest_descent' )
               [ f_plus, g_plus    ] = ...
                    feval(fname,trial_point,'f',varargin{:});
               if ( options.goal(1:3) == 'max' & options.free_g == 1 )
                  f_plus =-f_plus; g_plus =-g_plus;
               end
            end
            if strcmp( options.method,'gauss_newton' )
               [ r_plus, jac_plus  ] = ...
                    feval(fname,trial_point,'all',varargin{:});
               f_plus = 0.5*r_plus'*r_plus;
               g_plus = jac_plus'*r_plus;
               H_plus = jac_plus'*jac_plus;
            end

            %  Test to see whether or not the trial_point is valid:
            rho = ( f - f_plus ) / ( -g'*s - 0.5*s'*H*s );
            if ( rho < eta_1 )  % reject the step
               delta = gamma_1*min( delta, norm(newton_step) );
            elseif ( rho < eta_2 )  % accept the step, but don't change delta
               valid = 1;
               options.tr_radius = delta;
               x_plus = trial_point;
               if strcmp( options.method,'newton' )
                  [ f_temp, g_plus, H_plus ] = ...
                    feval(fname,trial_point,'g',varargin{:});
                  if ( options.goal(1:3) == 'max' & options.free_g == 1 )
                     g_plus =-g_plus; H_plus =-H_plus;
                  end
               end
               if strcmp( options.method,'secant' )
                  [ f_temp, g_plus    ] = ...
                       feval(fname,trial_point,'g',varargin{:});
                  if ( options.goal(1:3) == 'max' & options.free_g == 1 )
                     g_plus =-g_plus;
                  end
               end
               if strcmp( options.method,'steepest_descent' )
                  [ f_temp, g_plus    ] = ...
                       feval(fname,trial_point,'g',varargin{:});
                  if ( options.goal(1:3) == 'max' & options.free_g == 1 )
                     g_plus =-g_plus;
                  end
               end
                  
            elseif ( rho >= eta_2 )  % accept and expand the radius
               valid = 1;
               delta = min( gamma_2*delta, options.max_step );
               options.tr_radius = delta;
               x_plus = trial_point;
               if strcmp( options.method,'newton' )
                  [ f_temp, g_plus, H_plus ] = ...
                    feval(fname,trial_point,'g',varargin{:});
                  if ( options.goal(1:3) == 'max' & options.free_g == 1 )
                     g_plus =-g_plus; H_plus =-H_plus;
                  end
               end
               if strcmp( options.method,'secant' )
                  [ f_temp, g_plus    ] = ...
                       feval(fname,trial_point,'g',varargin{:});
                  if ( options.goal(1:3) == 'max' & options.free_g == 1 )
                     g_plus =-g_plus;
                  end
               end
               if strcmp( options.method,'steepest_descent' )
                  [ f_temp, g_plus    ] = ...
                       feval(fname,trial_point,'g',varargin{:});
                  if ( options.goal(1:3) == 'max' & options.free_g == 1 )
                     g_plus =-g_plus;
                  end
               end
            end
            %  check function count, print warning, set valid=-1

            if ( f_count == options.max_fevals )
               valid = 1;
               if ( f_plus > f ) % we didn't find a better point
                  f_plus = f;
                  g_plus = g;
                  H_plus = H;
                  x_plus = x;
               end
            end

            if ( delta < options.step_tolerance )
               fprintf('Trust region radius is getting too small.\n')
               valid = 1;
               if ( f_plus > f ) % we didn't find a better point
                  f_plus = f;
                  g_plus = g;
                  H_plus = H;
                  x_plus = x;
               end
            end
         end
         % perform a convergence test based on KKT conditions
         if (~isempty(active.set))
            if ( length(active.set)==n_desvar )
               fprintf('all variables are active\n');
               g_set = -g_plus(abs(active.set)).*active.set;
               if ( min(g_set) > 0 )
                 fprintf('KKT conditions are satisfied\n\n')
                 converged = 1;
               end
            else
               g_free = g_plus(active.free).*...
                       max( abs(x(active.free)), ...
                       diag(options.scale_x(active.free,active.free)) )/...
                       max( f_plus, options.scale_f );
               g_set  =-g_plus(abs(active.set)).*active.set;
               if ( norm(g_free,inf) < options.gradient_tolerance & min(g_set) > 0 )
                  fprintf('KKT conditions are satisfied for box constrained problem\n')
                  converged = 1;
               end  
            end
         end
      end
      %  Trial point satisfies the globalization criteria, update iteration.
      step = x_plus - x;

      %  Update our solution
      if strcmp( options.method,'newton' )
         H = H_plus;
      end
      if strcmp( options.method,'secant' )
         y = g_plus - g;   % STEP is REALLY trial_point - x !!!!!!!
         % only update the Hessian if we 
         if ( y'*step >= eps*norm(g) )
            H = H + y*y'/(y'*step) - H*step*step'*H/(step'*H*step);
	 end
      end
      if strcmp( options.method,'gauss_newton' )
         H = H_plus;
      end

      f = f_plus;
      g = g_plus;
      x = x_plus;

      if ( options.verbose )
         print_step(iteration,step,x,f,g,options)
      end
 
      %  We may want to move this to a dedicated function (convergence_test)
      %  Test for convergence
      if (iteration == options.max_iterations)
         fprintf('Maximum number of iterations reached\n')
         converged = 1;
      end

      if ( f_count == options.max_fevals )
         fprintf('Used the maximum number of function evaluations.\n')
         converged = 1;
      end

      s_test = abs( step ) ./ max([ abs(x');   diag(options.scale_x)'] )';
      if ( norm(s_test,inf) < options.step_tolerance )
         fprintf('Step in design variables is becoming too small.\n')
         converged = 1;
      end

      g_test = g.*max( abs(x), diag(options.scale_x) )/ max( f, options.scale_f);
      if ( norm(g_test,inf) < options.gradient_tolerance )
         fprintf('Gradient is within tolerance, x likely a local optimum.\n')
         converged = 1;
      end
   end
   fprintf('Optimization required %i function/gradient evaluations\n\n',f_count)
%------------------------------------------------------------------------

function [fname,options] = initialize(fname,options,n_desvar)
%------------------------------------------------------------------------
%  Set Optimization Method
   if ( isfield(options,'method') ~= 1 )
      options.method = 'secant'; end
   if ( isfield(options,'globalization') ~= 1 )
      options.globalization = 'none'; end

   if ( isfield(options,'goal') ~= 1 )
      options.goal = 'minimization'; end

   if strcmp( options.method,'gauss_newton' )
      if ( options.goal(1:3) == 'max' )
         fprintf('Combination of gauss and maximization not supported,\n')
         fprintf('I mean, it is called LEAST squares afterall\n')
         keyboard
      end
   end

%  Set interactive function names
   if strcmp( fname,'interactive' )
      if strcmp( options.method,'newton' )
         fname = 'n_interactive';
      end
   end
   if strcmp( fname,'interactive' )
      if strcmp( options.method,'gauss_newton' )
         fname = 'g_interactive'; 
      end
   end

%  Set free gradient flag
   if ( isfield(options,'free_g') ~= 1 )
      options.free_g = 1;
   end

%  Set output options
   if ( isfield(options,'verbose') ~= 1 )
      options.verbose = 1;
   end

%  Set scaling
   if ( isfield(options,'scale_x') ~= 1 )
      options.scale_x = eye(n_desvar);
   else
      if ( min(size(options.scale_x)) == 1)
         options.scale_x = diag(options.scale_x);
      end
   end
   options.scale_x = abs(options.scale_x);

   if ( isfield(options,'scale_f') ~= 1 )
      options.scale_f = 1.0;
   else
      options.scale_f = abs(options.scale_f); end

%  Set Bound Constraints
   if ( isfield(options,'x_lower') ~= 1 )
      options.x_lower =-realmax*ones(n_desvar,1); end
      
   if ( isfield(options,'x_upper') ~= 1 )
      options.x_upper = realmax*ones(n_desvar,1); end
      
%  Set Convergence Criteria
   if ( isfield(options,'max_iterations') ~= 1 ) 
      options.max_iterations = 10; end
   if ( isfield(options,'max_fevals') ~= 1 ) 
      options.max_fevals = 30; end
   if ( isfield(options,'gradient_tolerance') ~= 1 )
      options.gradient_tolerance = 0.000001; end
   if ( isfield(options,'step_tolerance') ~= 1 )
      options.step_tolerance = 0.000001; end

%  Set Globalization Parameters
   if ( isfield(options,'max_step') ~= 1 )
      options.max_step = 10.*norm(options.scale_x,2); end

   if strcmp( options.globalization,'line_search' )
      if ( isfield(options,'alpha') ~= 1 )
         options.alpha = 0.0001; end, end

%------------------------------------------------------------------------

function [s,val,lambda,active] = box_trust(g,H,delta,lower,upper,options)
%------------------------------------------------------------------------
%  box_trust.m - a driver for a trust region sub-problem 
%                with (possibly) box constraints
% [s,val,posdef,count,lambda,active] = BOX_TRUST(g,H,delta,lower,upper)
% Solves the trust region
% problem:     min{g^Ts + 1/2 s^THs: ||s|| <= delta}
% and such that:      lower <= s <= upper. 
% We assume that s = 0 is feasible.
% An active set strategy is used. This requires multiple
% solutions of standard trust-region sub-problems, where the set of
% free variables is iteratively adjusted via an active set rule.
% 'active' is a data structure that marks the active set
% and includes some ancilliary data
% BOX_TRUST is meant to be applied to very small dimensional problems.
%
%------------------------------------------------------------------------
 ndes_vars = length(g);
 g = g(:); % be sure it's a column
%
% Begin with an empty active set
% 
 active.count = 0;
 active.set =[]; % allow the user to specify an initial set ?
 active.free = [1:ndes_vars]; active.converged = 0;
 count_max = 2*ndes_vars^3; % ??? good idea ??? user-specified
%
 if min(upper) <=-realmin | max(lower) >= realmin
     disp('Assumption that  lower < 0 < upper is violated')
	 lower
	 upper
	 s = zeros(size(g)); lambda = 0; val = 0;
	 return
 end % if
%
 while active.count <= count_max & ~active.converged
%     Given an active set form a reduced std. TR sub-problem
     [g_k, H_k, delta_k, active.free, active.p_c]  = ...
	                  reduce(g,H,delta,lower,upper,active.set);
	 b_feasible = 0;  b_optimal = 0;
	 if delta_k >= 0
%        Solve the reduced std. TR sub-problem
        [s_f, lambda ] = tr_subproblem(g_k,H_k,delta_k,options);
%       [s_f,val,posdef,count,lambda] = trust(g_k,H_k,delta_k);
%        Test box constraints for the 'free' variables - adjust the active set
  	    [active.set, active.count, b_feasible]  = ...
               test_feas(s_f,lower,upper,active.free,active.set,active.count);
		if b_feasible
%          re-assemble the step 
           s   = assemble(s_f,lower,upper,active);
%           test optimality for the constrained variables
	       [active.set, active.count, b_optimal] = ...
		                    test_opt(g,H,s,lambda, active.set, active.count);
		end % if 
	 else % negative reduced TR radius - delete a constraint
	    disp(['delta_k is negative :',num2str(delta_k)]) 
		return
	 end % if
	 active.converged = b_feasible & b_optimal;
 end % while
%
   val = g'*s + .5*s'*H*s;
%
% internal functions
%---------------------------------------------------------------------------
  function [g_f, H_ff, delta_k, active_free, p_c] = ...
                                   reduce(g,H,delta,lower,upper,active_set);
%
% compute the linear and quadratic terms for the free variables
% and a new trust-region radius for a reduced TR problem
% The Hessian and gradient are  re-arranged to
%      | H_ff | H_fc  |        |  g_f  |
%  H = | ------------ | ;  g = | ----- |
%      | H_cf | H_cc  |        |  g_c  |
%
% The linear term for the free variables in the sub-problem is
%
%   g_f + H_fc*p_c;  where p_c is the vector of constrained vars
%
 n       = length(g);
 move_to = n;
 p_c     = [];
 list = [1:n]';
 for j = length(active_set):-1:1
%
    aj    = abs(active_set(j));
	I     = eye(n);
	tmp   = I(aj,:);
	I(aj,:)      = I(move_to,:);
        I(move_to,:) = tmp;
	H            = I*H*I;
	g            = I*g;
	list         = I*list;
	move_to      = move_to - 1;	
	bj  = ( upper(aj)*(aj + active_set(j)) + lower(aj)*(aj - active_set(j)))/(2*aj);

  %p_c = [p_c ; bj];
  p_c = [bj; p_c];
  end % for loop
%
 if move_to == n
    H_ff = H;
	g_f  = g;
 elseif move_to == 0
    H_ff = []; g_f = [];
 else
    H_ff = H(1:move_to,1:move_to);
    g_f  = g(1:move_to) + H(1:move_to,move_to+1:end)*p_c;
 end % if
%
% compute the  radius for the reduced problem
%
 delta_k = delta - norm(p_c);
%
 active_free = list(1:move_to);
% return
%----------------------------------------------------------------------------
 function p = assemble(s_f,lower,upper,active);	
%
% assemble the complete  vector from the 'free'
% and the box-constrained components

% length(p) = length(s_f) + length(i_active) 
%           = length(lower) = length(upper)
%
  p(active.free)     = s_f;
  p(abs(active.set)) = active.p_c;
  p = p(:); % make sure it's a column
%
% return
% 
%-------------------------------------------------------------------------
 function [new_active_set, count_out, b_feasible] = ...
                         test_feas(s_f,lower,upper,active_free,active_set,count_in)
%
% Test to see if any of the free variables violate a box constraint.
% If so, we add a (single) constraint to the active set.
%
 if isempty(active_free) % vacuous case
     b_feasible     = 1;
	 count_out      = count_in;
	 new_active_set =active_set;
	 return
 end % if
%
 d_low = s_f - lower(active_free); % vector from s_f to lower bound
 d_upp = upper(active_free) - s_f; % vector from upper bound to s_f
%
 [low_min, i_low_min] = min(d_low);
 [upp_min, i_upp_min] = min(d_upp); 
%
 if low_min < 0 | upp_min < 0
    if low_min < upp_min % a lower bound is the worst violator
       worst_violator = -active_free(i_low_min(1));
    else                 % an upper bound is the worst violator
       worst_violator =  active_free(i_upp_min(1));
    end % inner if
    tmp1           = [active_set; worst_violator];
    [tmp2, i_sort] = sort(abs(tmp1));
    new_active_set = tmp1(i_sort);
	b_feasible     = 0;
	count_out      = count_in + 1;
 else
    new_active_set = active_set;
	b_feasible     = 1;
	count_out      = count_in;
 end % outer if
%
% return
% 
%-------------------------------------------------------------------------
 function [new_active_set, count_out, optimal]  = ...
                      test_opt(g,H,p,lambda,active_set,count_in);
%
% Test the sign of the KKT multipliers associated with the bound constraints
% If any violate the test, delete the worst violator from the active set
%
  if isempty(active_set) % vacuous case
     optimal        = 1;
	 count_out      = count_in;
	 new_active_set =[];
	 return
  end % vacuous case
%
  nabla_L =  g(:) + H*p(:) + 2*lambda*p(:); % check the sign on lambda
  nu      = -nabla_L(abs(active_set)).*sign(active_set);
% Find the smallest mulitplier
  [min_nu, i_min_nu] = min(nu);
  i_min_nu = i_min_nu(1);
%
  if min_nu >= 0 % all multipliers are positive
      optimal        = 1;
	  count_out      = count_in;
	  new_active_set = active_set;
  else           % negative mulitplier - delete a constraint 
      optimal   = 0;
	  count_out = count_in + 1;
      if (i_min_nu == 1)
         new_active_set = active_set(2:end);
      elseif (i_min_nu == length(active_set))
         new_active_set = active_set(1:end-1);
      else
         new_active_set = [active_set(1:i_min_nu-1) ; active_set(i_min_nu+1:end)];
      end % if i_min_nu == 1
  end % if min_nu >= 0
%
% return
%
%---------------------------------------------------------------------------------

function [ step, c ] = newton_solve(H,g)
%------------------------------------------------------------------------
%  Solve for the Newton step: step = -H\g.  However, there may be cases
%  when the Hessian is not positive definite.  In this case, we'd like to
%  generate the step: step = -(H + cI)\g, where the non-negative constant
%  c guarantees that (H + cI) is a positive definite matrix.  Doing this,
%  we guarantee that the step is a descent direction, i.e. -g'*step > 0.
   
%  This algorithm comes from Dennis and Schnabel:

   %  "Condition" the matrix H, 
   max_diag = max(diag(H));
   min_diag = min(diag(H));
   if ( min_diag < sqrt(eps)*max(0,max_diag) )
      c        = 2*sqrt(eps)*( max(0,max_diag) - min_diag ) - min_diag;
      max_diag = max_diag + c;
   else
      c        = 0.;
   end

   max_off_diag = max(max( H - diag(diag(H)) ));
   if ( max_off_diag*(1+2*sqrt(eps)) > max_diag )
      c = c + (max_off_diag - max_diag) + 2*sqrt(eps)*max_off_diag;
      max_diag = max_off_diag*( 1+2*sqrt(eps) ); end

   if ( max_diag == 0 )
      c = 1;
      max_diag = 1; end

   if ( c>0 )
      H = H + c*eye(size(H));
   end   
      
   max_offl = sqrt( max( max_diag, max_off_diag/length(g) ) );

   %  Perform a perturbed Cholesky decomposition on H
   [ L, max_add ] = p_chol( H, max_offl );
   %  If H wasn't positive definite...
   if ( max_add > 0 )
      max_ev = H(1,1);
      min_ev = H(1,1);
      for i=1:length(g),
         off_row = sum(abs(H(i,:))) - abs(H(i,i));
         max_ev = max( max_ev, H(i,i) + off_row );
         min_ev = min( min_ev, H(i,i) - off_row );
      end
      sdd = max( (max_ev-min_ev)*sqrt(eps)-min_ev, 0 );
      c   = min( max_add, sdd );

      H   = H + c*eye(size(H));
      [ L, max_add ] = p_chol( H, 0. );
   end

   c = max(c, max_add);
   %  Now solve the problem (LL')*step = -g;
   lt_step =-L\g;
   step    = L'\lt_step;

function [ L, max_add ] = p_chol( H, max_offl )
%------------------------------------------------------------------------
   n = max(size(H));
   L = zeros(size(H));

   min_l  = sqrt( sqrt(eps) )*max_offl;
   min_l2 = 0.;

   if ( max_offl == 0 )
      max_offl = sqrt( norm(diag(H),inf) );
      min_l2   = sqrt(eps)*max_offl;
   end

   max_add = 0.;

   for j=1:n
      L(j,j) = H(j,j) - L(j,1:j-1)*L(j,1:j-1)';
      min_ljj = 0.;
      for i=j+1:n
         L(i,j) = H(j,i) - L(i,1:j-1)*L(j,1:j-1)';
         min_ljj = max( abs(L(i,j)), min_ljj );
      end
      min_ljj = max( min_ljj/max_offl, min_l );
      if ( L(j,j) > min_ljj^2 )
         %  normal Cholesky iteration...
         L(j,j) = sqrt( L(j,j) );
      else
         %  alter H so the Cholesky iteration can proceed...
         if ( min_ljj < min_l2 )
            %  only possible if max_offl = 0
            min_ljj = min_l2; end
         max_add = max( max_add, min_ljj^2 - L(j,j) );
         L(j,j) = min_ljj;
      end
      L(j+1:n,j) = L(j+1:n,j) / L(j,j);
   end

function [] = print_step(iteration,step,x,f,g,options)
%------------------------------------------------------------------------
   n_desvar = length(x);

   fprintf(' Iteration %3i\n',iteration);
   fprintf(' -------------------------------------------------------\n');
   fprintf(' Design Variables: ');
   for i=1:n_desvar-1, fprintf(' %15.8e, ',x(i)); end
   fprintf(' %15.8e\n',x(n_desvar));
   
   if ( options.goal(1:3) == 'min' )
      fprintf(' Function Value:    %15.8e\n', f);
   else
      fprintf(' Function Value:    %15.8e\n',-f);
   end

   fprintf(' Step:             ');
   for i=1:n_desvar-1, fprintf(' %15.8e, ',step(i)); end
   fprintf(' %15.8e\n',step(n_desvar));
   
   fprintf(' Gradient:         ');
   if ( options.goal(1:3) == 'min' )
      for i=1:n_desvar-1, fprintf(' %15.8e, ',g(i)); end
      fprintf(' %15.8e\n', g(n_desvar));
   else
      for i=1:n_desvar-1, fprintf(' %15.8e, ',-g(i)); end
      fprintf(' %15.8e\n',-g(n_desvar));
   end

   fprintf(' Norm of Step:      %15.8e\n', norm(step,2));
   fprintf(' Norm of Gradient:  %15.8e\n\n', norm(g,2));

function [ s, lambda ] = tr_subproblem(g,H,delta,options)
%------------------------------------------------------------------------
   newton_step = newton_solve(H,g);  % we are redoing this under the
                                     % assumption that it is cheap.
   n_desvar = length(g);

   if ( norm(newton_step,2) < delta )
      s      = newton_step;
      lambda = 0;
   else
      mu = 0.;
      s  = newton_step;
      d_mu = 1.;     % to enter the routine below
      while ( abs(norm(s,2)-delta) > max(options.step_tolerance,sqrt(eps)) )
         r_mu     = norm(s,2) - delta;
         [temp,c] = newton_solve( H + mu*eye(n_desvar), s );
         %  if H is not positive definite, we want to start with
         %  a value of mu so that H+mu*I is.
         mu       = max(mu,c);
         temp     =-temp;
         dr_dmu   =-s'*temp / sqrt( s'*s );
         %  the norm(s)/delta scaling factor results in solving
         %  the secular equation
         d_mu     =-r_mu / dr_dmu     * norm(s,2)/delta;
         mu       = mu + d_mu;
         %  we could reuse the factorization above, however,
	 %  efficiency is not a major concern here.
         s        = newton_solve( H + mu*eye(n_desvar), g );
      end
      lambda      = mu/2;
   end

function [ f, g ] = interactive(x,flag)
%------------------------------------------------------------------------
   n_desvar = length(x);

   if ( flag=='all' )
      fprintf(' enter the function value corresponding to x =\n')
      for i=1:n_desvar-1, fprintf(' %17.10e',x(i)); end
      fprintf(' %17.10e\n',x(n_desvar))
      f = input(' f = > ');
      fprintf(' enter the gradient of the function at x\n')
      for i=1:n_desvar, 
         fprintf(' g(%2i)',i);
         g(i) = input(' = > '); end
      g = reshape(g,[n_desvar,1]);
      fprintf('\n')
   elseif ( flag=='f' )
      fprintf(' enter the function value corresponding to x =\n')
      for i=1:n_desvar-1, fprintf(' %17.10e',x(i)); end
      fprintf(' %17.10e\n',x(n_desvar))
      f = input(' f = > ');
      g = [];
   elseif ( flag=='g' )
      f = [];
      fprintf(' enter the gradient of the function at x\n')
      for i=1:n_desvar, 
         fprintf(' g(%2i)',i);
         g(i) = input(' = > '); end
      g = reshape(g,[n_desvar,1]);
      fprintf('\n')
   end

function [ f, g, H ] = n_interactive(x)
%------------------------------------------------------------------------
   n_desvar = length(x);

   fprintf(' enter the function value corresponding to x =\n')
   for i=1:n_desvar, fprintf(' %17.10e\n',x(i)); end
   f = input(' f = > ');

   fprintf(' enter the gradient of the function at x\n')
   for i=1:n_desvar, 
      fprintf(' g(%2i)',i);
      g(i) = input(' = > '); end
   g = reshape(g,[n_desvar,1]);

   fprintf(' enter the hessian of the function at x\n')
   for i=1:n_desvar,
      for j=1:n_desvar,
         fprintf(' H(%2i,%2i)',i,j);
         H(i,j) = input(' = > ');
      end
   end
   fprintf('\n')

function [ res, jac ] = g_interactive(x)
%------------------------------------------------------------------------
   n_desvar = length(x);

   n = input(' input number of equations = > ');
   fprintf(' enter the residual value corresponding to x =\n')
   for i=1:n_desvar, fprintf(' %17.10e\n',x(i)); end
   for i=1:n, 
      fprintf(' res(%2i)',i);
      res(i,1) = input(' = > '); end
   res = reshape(res,[n,1]);
   for i=1:n,
      for j=1:n_desvar,
         fprintf(' jac(%2i,%2i)',i,j);
         jac(i,j) = input(' = > ');
      end
   end
   fprintf('\n')
