function [ ErrL2, ErrH1 ] = fem1d_spectral_numeric ( N )

%*****************************************************************************80
%
%% FEM1D_SPECTRAL_NUMERIC applies the spectral finite element method to a 1D problem.
%
%  Discussion:
%
%    This function solves the problem u'' = - pi^2 * sin( pi * x ) for x 
%    in (-1,1), with boundary conditions u(-1) = u(1) = 0.
%
%    This problem has exact solution u(x) = sin(pi*x).
%
%    We use the spectral finite element method.  We assume that the solution
%    can be written in terms of polynomials:
%
%      phi_1 = x^0     * (x-1)*(x+1),
%      phi_2 = x^1     * (x-1)*(x+1)
%      ...
%      phi_i = x^(i-1) * (x-1)*(x+1) ...
%
%    For this particular problem, the solution is an odd function, so only every
%    other basis function will actually be useful.
%
%    MATLAB's function quad() is used to numerically approximate the integrals.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 October 2011
%
%  Author:
%
%    Miro Stoyanov
%
%  Parameters:
%
%    Input, integer N, the number of polynomials that we can use.  
%
%    Output, real ErrL2, ErrH1, the L2 and H1 norms of the error.
%

% assign matrix T and vector R
T = zeros( N, N );
R = zeros( N, 1 );

% add the entries for T and R
for k = 1:N
    for i = 1:N
        % add the entries to the matrix
        T(k,i) = solveFEM_assignment1_B( i, k );
    end;
    R(k) = solveFEM_assignment1_R( k ); % form the right-hand side
end;

% solve the projected finita dimensional problem
disp([' Condition number of the matrix is ',num2str(cond( T ))]);
C = T \ R;


% Plot the solution
xx = -1:0.05:1; % pick points on the x-axis
pp = zeros( size( xx ) ); % this would be the computer approximation
uu = zeros( size( xx ) ); % this would be the exact solution
for i = 1 : max( size( C ) )
    pp = pp + C(i) * xx.^(i-1) .* ( xx-1 ) .* ( xx+1 );
end;
uu = sin( pi * xx );
plot( xx, pp, xx, uu ); % plot

% get the errors
ErrL2 = solveFEM_assignment1_L2( C );
ErrH1 = solveFEM_assignment1_H1( C );



function [ y ] = solveFEM_assignment1_B_eval( x, i, k )
% this takes the two polynomials phi_i and phi_k, takes their derivatives
% and multiplies them
% this can be given to the quad MATLAB funciton to compute the integral for
% B(:,:)
% the plynomials are x^(i-1)*(x-1)*(x+1) for i and k
% the derivatives are (i-1)*x^(i-2)*(x-1)*(x+1) + x^(i-1)*(x-1) + x^(i-1)*(x+1)
% which is true for all i > 1, if i == 1, then we have to use the short formula (x-1) + (x+1)
if ( k > 1 )
    if ( i > 1 )
        y = ( (k-1)*x.^(k-2).*(x-1).*(x+1) + x.^(k-1).*(x-1) + x.^(k-1).*(x+1) ) .* ...
            ( (i-1)*x.^(i-2).*(x-1).*(x+1) + x.^(i-1).*(x-1) + x.^(i-1).*(x+1) );
    else
        y = ( (k-1)*x.^(k-2).*(x-1).*(x+1) + x.^(k-1).*(x-1) + x.^(k-1).*(x+1) ) .* ...
            ( (x-1) + (x+1) );
    end;
else
   if ( i > 1 )
        y = ( (x-1) + (x+1) ) .* ...
            ( (i-1)*x.^(i-2).*(x-1).*(x+1) + x.^(i-1).*(x-1) + x.^(i-1).*(x+1) );
    else
        y = ( (x-1) + (x+1) ) .* ...
            ( (x-1) + (x+1) );
    end;
end;

function [ y ] = solveFEM_assignment1_R_eval( x, k )
% this takes the polynomial phi_k and multiplies it by -pi^2*sin( x*pi 7)
y = x.^(k-1).*(x-1).*(x+1) .* ( -pi^2 * sin( pi*x ) );

function [ I ] = solveFEM_assignment1_B( i, k )
% quad takes as first parameter a function, then the boundaries of
% integration, then error tolerance, then 0, then the two integers i and k
% are passed to the function as additional input
I = -quad( @solveFEM_assignment1_B_eval, -1, 1, 1.E-12, 0, i, k );

function [ I ] = solveFEM_assignment1_R( k )
I = quad( @solveFEM_assignment1_R_eval, -1, 1, 1.E-12, 0, k );

function [ e ] = solveFEM_assignment1_L2_eval( x, c )
% this is to be called from solveFEM_assignment1_L2
% c is the vector with coefficients associated with the polynomials
% we compute e = ( u - sin( pi * x ) )^2
e = zeros( size( x ) );
for i = 1 : max(size(c))
    e = e + c(i) * x.^(i-1) .* ( x-1 ) .* ( x+1 );
end;
e = e - sin( pi * x );
e = e.^2;

function [ e ] = solveFEM_assignment1_H1_eval( x, c )
% this is to be called from solveFEM_assignment1_H1
% c is the vector with coefficients associated with the polynomials
% we compute e = ( u - sin( pi * x ) )^2 +  ( u' - sin( pi * x )' )^2
e = zeros( size( x ) );
for i = 1 : max(size(c))
    e = e + c(i) * x.^(i-1) .* ( x-1 ) .* ( x+1 );
end;
e = e - sin( pi * x );
e = e.^2;

d = c(1) * ( (x-1) + (x+1) );
for i = 2 : max( size( c ) )
    d = d + c(i) * ( (i-1)*x.^(i-2).*(x-1).*(x+1) + x.^(i-1).*(x-1) + x.^(i-1).*(x+1) );
end;
d = d - pi*cos( pi*x );
e = e + d.^2;

function [ E ] = solveFEM_assignment1_L2( c )
% computes the L2 norm of the error in the approximation
E = sqrt( quad( @solveFEM_assignment1_L2_eval, -1, 1, 1.E-12, 0, c ) );

function [ E ] = solveFEM_assignment1_H1( c )
% computes the H1 norm of the error in the approximation
E = sqrt( quad( @solveFEM_assignment1_H1_eval, -1, 1, 1.E-12, 0, c ) );

