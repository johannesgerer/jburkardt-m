function [ z_star, PAR, exit ] = opt_fun ( f_name, n )

%*****************************************************************************80
%
%% OPT_FUN runs a finite dimensional optimization problem.
%
%  Discussion:
%
%    The problem is based on a discretization of a Mayer problem in
%    optimal control.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 February 2010
%
%  Author:
%
%    Gene Cliff
%
%  Parameters:
%
%    Input, function pointer @F_NAME, the name of a user-supplied function with
%    a single input argument N.  N is a discretization parameter.   The
%    finite-dimensional problem arises by treating the (scalar) control as piecewise
%    constant.  The function referenced by F_NAME must define the elements of
%    the underlying optimal control problem.  See ZERMELO.M as an example.
%
%    Input, integer N, the discretization parameter.
%
%    Output, real Z_STAR(*), the computed optimal solution.
%
%    Output, structure PAR, the problem data.
%
%    Output, integer EXIT, is positive if the optimization was successful.
%

%
%  F_NAME sets up the problem data in the structure PAR.
%
% PAR = feval ( str2func ( f_name ), n );
  PAR = f_name ( n );
%
%  Those elements of PAR that were not set are given default values.
%
  if isfield ( PAR, 'initial_guess' )
    z0 = PAR.initial_guess(:);
  else
   z0 = zeros(length(PAR.ta)-1,1);
  end

  if isfield(PAR, 'LB')
    LB = PAR.LB*ones(size(z0));
  else
    LB = [];
  end

  if isfield(PAR, 'UB')
    UB = PAR.UB*ones(size(z0));
  else
    UB = [];
  end
%
%  Choose settings for the FMINCON optimizer.
%
%  Note, in particular, the "UseParallel" setting, which tells FMINCON to
%  take advantage of the parallel workers supplied by MATLABPOOL.
%
  OPT = optimset ( optimset( 'fmincon' ), ...
                       'LargeScale','off', ...
                       'Algorithm', 'active-set', ...
                       'Display' , 'iter', ...
                       'UseParallel', 'Always');

  h_cost = @(z) general_cost( z, PAR);
  h_cnst = @(z) general_constraint( z, PAR);
%
%  Run the optimization algorithm
%
  [ z_star, f_star, exit ] = fmincon ( h_cost, z0, ...
    [], [], [], [], LB, UB, h_cnst, OPT );

  return
end

