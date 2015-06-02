function u = forward ( e, r, sigma, t1, Nx, Nt, L )

%*****************************************************************************80
%
%% FORWARD uses the forward difference method to value a European call option.
%
%  Modified:
%
%    28 March 2005
%
%  Author:
%
%    Original MATLAB version by Desmond Higham
%
%  Reference:
%
%    Desmond Higham,
%    Black-Scholes for Scientific Computing Students,
%    Computing in Science and Engineering,
%    November/December 2004, Volume 6, Number 6, pages 72-79.
%
%  Parameters:
%
%    Input, real E, the exercise price.
%
%    Input, real R, the interest rate.
%
%    Input, real SIGMA, the volatility of the asset.
%
%    Input, real T1, the expiry date.
%
%    Input, integer NX, the number of "space" steps used to divide the 
%    interval [0,L].
%
%    Input, integer NT, the number of time steps.
%
%    Input, real L, the maximum value of S to consider.
%
%    Output, real U(NX-1,NT+1), the value of the European call option.
%
  k = t1 / Nt;
  h = L / Nx;
  TR1 = diag ( ones ( Nx-2,1),1) - diag ( ones(Nx-2,1), -1 );
  TR2 = -2 * eye(Nx-1,Nx-1) + diag(ones(Nx-2,1),1) + diag(ones(Nx-2,1),-1);
  mvec = [1:Nx-1];
  D1 = diag ( mvec );
  D2 = diag ( mvec.^2 );
  Aftcs = ( 1.0 - r * k ) * eye ( Nx-1,Nx-1 ) ...
        + 0.5 * k * sigma^2 * D2 * TR2 ...
        + 0.5 * k * r * D1 * TR1;

  u = zeros ( Nx-1,Nt+1);
  uzero = max ( [h:h:L-h]'-e, 0.0 );
  u(:,1) = uzero;
  p = zeros(Nx-1,1);
  
  for i = 1 : Nt
    tau = ( i - 1 ) * k;
    p(end) = 0.5 * k * (Nx-1) * ((sigma^2)*(Nx-1)+r) * ( L - e * exp ( - r * tau ) );
    u(:,i+1) = Aftcs * u(:,i) + p;
  end

  return
end
