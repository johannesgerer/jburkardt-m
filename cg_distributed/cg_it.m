function [ z, rnorm ] = cg_it ( A, x )

%*****************************************************************************80
%
%% CG_IT carries out the conjugate gradient iteration.
%
%  Modified:
%
%    08 March 2010
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
%    Input, real A(N,N), the matrix.
%
%    Input, real X(N,1), the right hand side.
%
%    Output, real Z(N,1), the estimated solution.
%
%    Output, real RNORM, the norm of the residual ( x - A * z );
%
  z = zeros ( size ( x ) );
  r = x;
  rho = r' * r;
  p = r;

  for i = 1 : 15
    q = A * p;
    alpha = rho / ( p' * q );
    z = z + alpha * p;
    rho0 = rho;
    r = r - alpha * q;
    rho = r' * r;
    beta = rho / rho0;
    p = r + beta * p;
  end

  rnorm =  norm ( x - A * z );

  return
end
