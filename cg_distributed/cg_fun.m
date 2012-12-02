function [ zeta, x ] = cg_fun ( )

%*****************************************************************************80
%
%% CG_FUN is a distributed memory version of the NAS CG Benchmark.
%
%  Modified:
%
%    19 September 2010
%
%  Author:
%
%    Gaurav Sharma, Jos Martin
%
%  Reference:
%
%    Gaurav Sharma, Jos Martin,
%    MATLAB: A Language for Parallel Computing,
%    International Journal of Parallel Programming,
%    Volume 37, Number 1, pages 3-36, February 2009.
%
%  Parameters:
%
%    Output, real ZETA, an estimate for the smallest eigenvalue of 
%    A + 20 * I.  In other words, ZETA - 20 is an estimated eigenvalue 
%    of A.
%
%    Output, real X(N), the estimated eigenvector.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CG_FUN:\n' );
  fprintf ( 1, '  The NAS Conjugate Gradient benchmark\n' );
  fprintf ( 1, '  adapted to use distributed memory.\n' );

  n = 1400;
  nonzer = 7;
  lambda = 20.0;
  niter = 15;
  nz = n * ( nonzer + 1 ) * ( nonzer + 1 ) + n * ( nonzer + 2 );

% A = sprand ( n, n, 0.5 * nz / n^2, codistributor ( ) );
  A = sprand ( n, n, 0.5 * nz / n^2, codistributor ( ) );
%
%  We want a random matrix A, but we also need it to be symmetric.
%  We enforce that condition here.
%
  A = 0.5 * ( A + A' );

% I = speye ( n );
  I = speye ( n, codistributor ( ) );
  A = A - lambda * I;

  x = ones ( n, 1 );

  for iter = 1 : niter
    [ z, rnorm ] = cg_it ( A, x );
    zeta = lambda + 1 / ( x' * z );
    x = z / norm ( z );
  end

  return
end
