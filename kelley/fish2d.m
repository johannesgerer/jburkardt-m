function u = fish2d ( f )

% Poisson solver in 2D based on matlab fft
% square geometry, homogeneous Dirichlet boundary conditions
% requires uniform mesh (2^k-1)^2 interior nodes 
%
% C. T. Kelley, January 6, 1994
%
% Solves - u_xx - u_yy = f
%
% Requires sintv.m and isintv.m
%
%  Disclaimer:
%
%    This code comes with no guarantee or warranty of any kind.
%
%  Author:
%
%    Tim Kelley
%
%  Reference:
%
%    Tim Kelley,
%    Iterative Methods for Linear and Nonlinear Equations,
%    SIAM, 2004,
%    ISBN: 0898713528,
%    LC: QA297.8.K45.
%
%  Parameters:
%
%    Input, real F(M*M), the right hand side of the Poisson equation.
%
%    Output, real U(M,M), the solution of the Poisson equation.
%
%
  global fish_lal fish_ual ua;

  n = length ( f );
  m = sqrt(n);
  hh = .5/(m+1);
  h2 = (m+1)*(m+1);
  e = ones(m,1);
%
%  Don't compute eigenvalues, factor tridiagonal matrices
%  or allocate space for the 2-D representation of the solution
%  more than once. Note the use of global variables to store
%  fish_ual, fish_lal, and ua.
%
  if ( exist ( 'fish_ual' ) == 1 )
    [ f1, f2 ] = size ( fish_ual );
    m1=sqrt(f1);
  else
    m1=m;
  end

  if (exist('fish_ual') == 0) | (m1 ~= m)
%
% allocate room for ua, the 2D representation of the solution
%
    ua = zeros ( m, m );
%
% set up diagonal of system using eigenvalues of 1D operator
%
    x=1:m;
    x=pi*hh*x';
    lam=sin(x);
    lam=h2*(2*ones(m,1) + 4*lam.*lam);
    en=h2*ones(n,1);
    fn=en;
    gn=en;
    dx=zeros(n,1);

    for i=1:m
      fn(i*m)=0;
      gn((i-1)*m+1)=0;
      dx((i-1)*m+1:i*m)=lam(i)*ones(m,1);
    end

    al=spdiags([-fn, dx, -gn], [-1,0,1], n,n);
%
% factor the tridiagonal matrix for solution in the x direction
%
    [fish_lal,fish_ual]=lu(al);

  end
%
% Map f into a rectangular array.
% Take sine transform in y direction.
%
  ua(:) = f;
  ua=sintv(ua).';
%
% Solve in the x direction
%
  ua(:) = fish_ual\(fish_lal\ua(:));
%
% Take inverse transform.
%
  ua = isintv((ua.'));
%
% Map uz into a linear array.
%
  u = ua(:);
