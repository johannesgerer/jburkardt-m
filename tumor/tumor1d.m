function tumor1d ( )

%% TUMOR1D solves -u''+u=f on an interval 0<x<1.
% 
%  Discussion:
%
%    Homogeneous Neumann boundary conditions are imposed; that is
%    u'=0 at x=0 and at x=1.  
%
%    The code uses continuous piecewise quadratic basis functions.
%
%    A banded Cholesky solver should be used for this problem; however
%    for simplicity we have used the built-in solver A\b
% 
%  Parameters:
%
%    real AREA(NEL), the area (length) of each element.
%
%    integer INDX(NP), gives the index of the finite element variable
%    associated with each node, or 0 if none.
%
%    Input, integer NEL, the number of elements.
%
%    Input, integer NEQN, the number of equations.
%
%    Input, integer NNODES, the number of nodes per element.
%
%    Input, integer NODE(NEL,NNODES), the indices of the nodes making up each element.
%
%    Input, integer NQ, the number of quadrature points per element used in the
%    assembly process.
%
%    Input, integer NUNK, the number of unknowns.
%
%    Input, real XC(NP), the X coordinate of each node.
%
%    nx    -  number of points in the x-direction 
%    xl,xr -  left and right x-coordinates of domain (given interval)
%    nqe   -  number of quadrature points per element used in the error routine
%
%    xq(it,i)    - x-coordinate of quadrature point j for element it 
%    np          - number of global nodes (or points)
%
%    a   -     main diagonal of the coefficient matrix 
%    c   -     subdiagonal of coefficient matrix (matrix is symmetric)  
%    f(i)    - right hand side array which is overwritten by solver with
%              solution
%
  global alpha1
  global alpha2
  global area
  global beta
  global beta1
  global beta2
  global czero
  global difeta
  global etazero
  global fzero
  global gamma1
  global gamma2
  global indx
  global kappa
  global lambda1
  global lambda2
  global m
  global nel
  global neqn
  global nnodes  
  global node
  global nq
  global nu1
  global nu2
  global nunk
  global vzero
  global xc
  global xl
  global xr

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TUMOR1D:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  A one dimensional model of tumor growth.\n' );

  nx = 41;
  maxstep_time = 10000;
  maxstep_time = 1;
  time_final = 0.1;
  maxiter = 20;
  maxiter = 1;
  time = 0.0;
  nnodes = 3;
  neqn = 4;
  tolerance = 0.5e-6;
%
%  Set the biological constants.
%
[ alpha1, alpha2, beta, beta1, beta2, czero, difeta, etazero, fzero, ...
  gamma1, gamma2, kappa, lambda1, lambda2, m, nu1, nu2, vzero, xl, xr ] = ...
  bio_constants ( );
%
%  Set up the geometry arrays.
%
  geom
%
%  Assemble the mass matrix.
%
  a_mass = assemble_mass ( area, indx, nel, neqn, nnodes, node, ...
    nq, nunk, xc );
%
%  Factor the mass matrix.
%
  a_mass = chol ( a_mass );
% 
%  Set the initial conditions.
%
  [ cold, etaold, fold, vold ] = set_ic ( np, indx, xc, m, czero, ...
  etazero, fzero, vzero );  

  vcur = vold;
  ccur = cold;
  fcur = fold;
  etacur = etaold;
%
%  TIME STEPPING LOOP
%
  dx = ( xr - xl ) / ( nx - 1 );
  dt = 0.5 * dx * dx 

  for nt = 1 : maxstep_time

    time = time + dt
    if ( time_final <= time )
      break;
    end
%
%  ITERATION LOOP at each timestep.
%
    for niter = 1 : maxiter
%
%  Update V.
%
      disp ( 'Solve v' )
      nuk = 1; 
      profile on
      vcur = solve_eqn ( nuk, time, dt, a_mass, vcur, ccur, fcur, ...
        etacur, vold );  
      profile viewer
      profile off
      pause
%
%  Update C.
%
      disp ( 'Solve c' )
      nuk = 2; 
      ccur = solve_eqn ( nuk, time, dt, a_mass, vcur, ccur, fcur, ...
        etacur, cold );   
%
%  Update F.
%
      disp ( 'Solve f' )
      nuk = 3; 
      fcur = solve_eqn ( nuk, time, dt, a_mass, vcur, ccur, fcur, ...
        etacur, fold );  
%
%  Update ETA.
%
      disp ( 'Assemble the stiffness matrix.' )
      nuk = 4; 
      assemble_stiff  
      disp ( 'Factor the stiffness matrix.' )
      a_stiff = chol ( a_stiff );
      disp ( 'Solve eta' )
      etacur = solve_eqn ( nuk, time, dt, a_stiff, vcur, ccur, fcur, ...
        etacur, etaold );   
%
%  Calculate the residual.
%
      disp ( 'Compute residual' )
      residual   
      if ( resid_norm <= tolerance )
        break;
      end 
%
%  If failed to converge in maxiter steps, then reduce time step and start again
%
      if ( niter == maxiter )
        disp ( 'Reducing time step.' );
        time = time - dt;
        dt = dt / 2.0;
        vcur = vold;
        ccur = cold;
        fcur = fold;
        etacur = etaold;
      end
    
    end
%
%  Get ready for next time step
%
    vold = vcur;  
    cold = ccur;
    fold = fcur;
    etaold = etacur;

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TUMOR1D:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
