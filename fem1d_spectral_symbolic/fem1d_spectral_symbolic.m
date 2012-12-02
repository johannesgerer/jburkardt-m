function [ ErrL2, ErrH1 ] = fem1d_spectral_symbolic ( N )

%*****************************************************************************80
%
%% FEM1D_SPECTRAL_SYMBOLIC applies the spectral finite element method to a 1D problem.
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
%    MATLAB's symbolic toolbox is necessary for this program to run.
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

syms x; % this activates the symbolic library

% assign matrix T and vector R
T = zeros( N, N );
R = zeros( N, 1 );

% add the entries for T and R
for k = 1:N
    phi_k = x^(k-1)*(x-1)*(x+1); % get the k-th polynomial
    for i = 1:N
        phi_i = x^(i-1)*(x-1)*(x+1); % get the i-th polynomial
        % add the entries to the matrix
        T(k,i) = solveFEM_assign1_B( phi_i, phi_k );
    end;
    R(k) = solveFEM_assign1_R( phi_k ); % form the right-hand side
end;

% solve the projected finita dimensional problem
disp([' Condition number of the matrix is ',num2str(cond( T ))]);
C = T \ R;

% use the vecotr C to form back the solution, sum_{i=0}^N c_i phi_i
u = 0;
for i = 1:N
    phi_i = x^(i-1)*(x-1)*(x+1); % get the i-th test function
    u = u + C(i) * phi_i; % add C(i) times the i-th test function
end;

% Plot the solution
xx = -1:0.05:1; % pick points on the x-axis
pp = zeros( size( xx ) ); % this would be the computer approximation
uu = zeros( size( xx ) ); % this would be the exact solution
for i = 1:max(size(xx))
    pp(i) = subs( u, xx(i) ); % get the computer approximation at xx(i)
    uu(i) = subs( sin(pi*x), xx(i) ); % get the exact solution at xx(i)
end;
plot( xx, pp, xx, uu ); % plot

% get the errors
ErrL2 = solveFEM_assign1_L2( u );
ErrH1 = solveFEM_assign1_H1( u );

function [ I ] = solveFEM_assign1_B( u, phi )
% int( f, x, -1, 1 ) integrates a function f with respect to x from -1 to 1
% diff( f, x ) differentiates f with respect to x
% eval converts a symbolic value to a numerical value (i.e. pi becomes 3.14)
syms x;
I = - eval( int( diff( u, x ) * diff( phi, x ), x, -1, 1 ) );

function [ I ] = solveFEM_assign1_R( phi )
syms x;
I = eval( int( - pi^2 * sin( pi*x ) * phi, x, -1, 1 ) );

function [ E ] = solveFEM_assign1_L2( u )
syms x;
E = sqrt( eval( int( ( u - sin( pi * x ) )^2, x, -1, 1 ) ) );

function [ E ] = solveFEM_assign1_H1( u )
syms x;
E = sqrt( eval( int( ( u - sin( pi * x ) )^2 + ( diff( u, x ) - pi*cos( pi * x ) )^2, x, -1, 1 ) ) );

