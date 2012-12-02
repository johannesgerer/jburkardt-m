function dy = tcell_rhs ( t, y )

%% TCELL_RHS evaluates the right hand side for the ODE solver TESTGM.
%
%  Discussion:
%
%    This function evaluates the right hand side of an ODE for the
%    time evolution of the solution coefficients for a reduced order
%    model of the Navier Stokes equations.
%
%    The file MATRIX.OUT contains information about various coefficient
%    matrices needed to evaluate the right hand side, and is loaded by
%    this routine.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2004
%
%  Author: 
%
%    Hyung-Chun Lee
%    Department of Mathematics
%    Ajou University, Korea
%
%  Parameters:
%
%    Input, real T, the current time.
%
%    Input, real Y(8), the current solution.
%
%    Output, real DY(8), the corresponding value of dY/dT.
%

%
%  Load the coefficient data from the file.
%
  load matrix.out
%
%  Distribute the data from the file.
%
  M = zeros(8,8);
  M = matrix(1:8,1:8);

  H = zeros(8,8);
  H = matrix(9:16,1:8);

  Q = zeros(8,8,8);
  for i = 1 : 8
    ii = 16+8*(i-1)+1;
    ij = 16+8*(i-1)+8;
    Q(:,:,i) = matrix(ii:ij,1:8);
  end

  N = zeros(8,1);
  N = matrix(81,1:8);

  R = zeros(8,8);
  R = matrix(82:89,1:8);

  C = zeros(8,1);
  C = matrix(90,1:8);

  MI = inv ( M );

  mu = 1;

  if ( t < 0.05 )
    alpha = 80.0 * t + 1.0;
  else
    alpha = -80.0 * ( t - 0.1 ) + 1.0;
  end

  beta = alpha / 3.0;

  if ( t < 0.05 )
    dbeta = 80.0 / 3.0;
  else 
    dbeta = -80.0 / 3.0;
  end

  dy = zeros(8,1);
  for i = 1 : 8
    dy(i) = -mu * H(i,:) * y - y' * Q(:,:,i) * y - beta * R(i,:) * y ...
      - beta * ( beta - 1.0 ) * C(i) - dbeta * N(i);
  end

  dy = MI * dy;

  return
end
