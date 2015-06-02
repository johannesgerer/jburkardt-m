function [ x, r, z, p, q, job ] = cg_rc ( n, b, x, r, z, p, q, job )

%*****************************************************************************80
%
%% CG_RC is a reverse communication conjugate gradient routine.
%
%  Discussion:
%
%    This routine seeks a solution of the linear system A*x=b
%    where b is a given right hand side vector, A is an n by n
%    symmetric positive definite matrix, and x is an unknown vector
%    to be determined.
%
%    Under the assumptions that the matrix A is large and sparse,
%    the conjugate gradient method may provide a solution when
%    a direct approach would be impractical because of excessive
%    requirements of storage or even of time.
%
%    The conjugate gradient method presented here does not require the
%    user to store the matrix A in a particular way.  Instead, it only
%    supposes that the user has a way of calculating
%      y = alpha * A * x + b * y
%    and of solving the preconditioned linear system
%      M * x = b
%    where M is some preconditioning matrix, which might be merely
%    the identity matrix, or a diagonal matrix containing the
%    diagonal entries of A.
%
%    This routine was extracted from the "templates" package.
%    There, it was not intended for direct access by a user;
%    instead, a higher routine called "cg()" was called once by
%    the user.  The cg() routine then made repeated calls to
%    cgrevcom() before returning the result to the user.
%
%    The reverse communication feature of cgrevcom() makes it, by itself,
%    a very powerful function.  It allows the user to handle issues of
%    storage and implementation that would otherwise have to be
%    mediated in a fixed way by the function argument list.  Therefore,
%    this version of cgrecom() has been extracted from the templates
%    library and documented as a stand-alone procedure.
%
%    The user sets the value of JOB to 1 before the first call,
%    indicating the beginning of the computation, and to the value of
%    2 thereafter, indicating a continuation call.
%    The output value of JOB is set by cgrevcom(), which
%    will return with an output value of JOB that requests a particular
%    new action from the user.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 January 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Richard Barrett, Michael Berry, Tony Chan, James Demmel,
%    June Donato, Jack Dongarra, Victor Eijkhout, Roidan Pozo,
%    Charles Romine, Henk van der Vorst,
%    Templates for the Solution of Linear Systems:
%    Building Blocks for Iterative Methods,
%    SIAM, 1994,
%    ISBN: 0898714710,
%    LC: QA297.8.T45.
%
%  Parameters:
%
%    Input, integer N, the dimension of the matrix.
%
%    Input, real B(N), the right hand side vector.
%
%    Input, real X(N).  On first call, the user
%    should store an initial guess for the solution in X.
%
%    Input, real R(N), Z(N), P(N), Q(N), work arrays.  The user should
%    create each of these before the first call, using the zeros() command.
%    On subsequent calls, the user may be asked to assign a value to one
%    of these vectors.
%
%    Input, integer JOB, communicates the task to be done.
%    The user needs to set the input value of JOB to 1, before the first call,
%    and then to 2 for every subsequent call for the given problem.
%
%    Output, real X(N), the current solution estimate.
%    Each time JOB is returned as 4, X has been updated.
%
%    Output, real R(N), Z(N), P(N), Q(N), work arrays.  Depending on the
%    output value of JOB, the user may be asked to carry out a computation
%    involving some of these vectors.
%
%    Output, integer JOB, communicates the task to be done.
%    * JOB = 1, compute Q = A * P;
%    * JOB = 2: solve M*Z=R, where M is the preconditioning matrix;
%    * JOB = 3: compute R = R - A * X;
%    * JOB = 4: check the residual R for convergence.  
%               If satisfactory, terminate the iteration.
%               If too many iterations were taken, terminate the iteration.
%

%
%  Local variables should be SAVED between calls.
%
  persistent iter
  persistent rho
  persistent rho_old
  persistent rlbl
%
%  Initialization.
%  Ask the user to compute the initial residual.
%
  if ( job == 1 )

    r(1:n) = b(1:n);

    job = 3;
    rlbl = 2;
%
%  Begin first conjugate gradient loop.
%  Ask the user for a preconditioner solve.
%
  elseif ( rlbl == 2 )

    iter = 1;

    job = 2;
    rlbl = 3;
%
%  Compute the direction.
%  Ask the user to compute ALPHA.
%  Save A*P to Q.
%
  elseif ( rlbl == 3 )

    rho = r(:)' * z(:);

    if ( 1 < iter )
      beta = rho / rho_old;
      z(1:n) = z(1:n) + beta * p(1:n);
    end

    p(1:n) = z(1:n);

    job = 1;
    rlbl = 4;
%
%  Compute current solution vector.
%  Ask the user to check the stopping criterion.
%
  elseif ( rlbl == 4 )

    pdotq = p(:)' * q(:);
    alpha = rho / pdotq;
    x(1:n) = x(1:n) + alpha * p(1:n);
    r(1:n) = r(1:n) - alpha * q(1:n);

    job = 4;
    rlbl = 5;
%
%  Begin the next step.
%  Ask for a preconditioner solve.
%
  elseif ( rlbl == 5 )

    rho_old = rho;
    iter = iter + 1;

    job = 2;
    rlbl = 3;

  end

  return
end
