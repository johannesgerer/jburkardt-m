function tw = trigauss ( n, alpha, beta )

%*****************************************************************************80
%
%% TRIGAUSS computes a trigonometric gaussian quadrature formula.
%
%  Discussion:
%
%    This function computes the N+1 angles and weights of a trigonometric 
%    gaussian quadrature formula on [ALPHA,BETA], with
%    0 < BETA - ALPHA <= pi.
%
%    The formula integrates the canonical trigonometric basis with accuracy 
%    from about 10^(-15) (for small omega) to about 10^(-13) (for omega --> pi) 
%    up to N = 300.
%
%  Modified:
%
%    19 May 2013
%
%  Author:
%
%    Gaspare Da Fies, Alvise Sommariva, Marco Vianello
%
%  Parameters:
%
%    Input, integer N, the trigonometric degree of exactness.
%
%    Input, real ALPHA, BETA, the angular interval.
%    0 < BETA - ALPHA <= pi.
%
%    Output, real TW(N+1,2) array of angles and weights.
%
  np1 = n + 1;
%
%  Compute the half angle subtended by the circle segment.
%
  omega = ( beta - alpha ) / 2.0;
%
%  Compute the modified Chebyshev recursion coefficients.
%
  ab = r_subchebyshev ( np1, omega );
%
%  Compute the quadrature rule.
%
  xw_symm_eigw = SymmMw ( np1, ab );
  tw = trigauss_conversion ( xw_symm_eigw, omega );
%
%  Adjust angles from the reference system to the physical system.
%
  tw(:,1) = tw(:,1) + ( beta + alpha ) / 2.0;

  return
end
function ab = r_subchebyshev ( n, omega )

%*****************************************************************************80
%
%% R_SUBCHEBYSHEV computes the modified Chebyshev recursion coefficients.
%
%  Modified:
%
%    19 May 2013
%
%  Author:
% 
%    Gerard Meurant, Alvise Sommariva 
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real OMEGA, the arc angle.
%
%    Output, real AB(NN,2), the coefficients of the three term recursion.
%    The dimension NN is N + 1 if N is odd, or N if N is even.
%
  N = n;
  n = n - 1;

  if rem ( N, 2 ) == 1
    NN = N + 1; 
    nn = n + 1;
  else
    NN = N; 
    nn = n;
  end
%
%  Compute the moments.
%
  mom = fast_moments_computation ( omega, 2 * nn + 1 );
%
%  Recurrence coefficients of the monic Chebyshev polynomials.
%
  abm(:,1) = zeros ( 2 * nn + 1, 1 );
  abm(:,2) = 0.25 * ones ( 2 * nn + 1, 1 ); 
  abm(1,2) = pi; 
  abm(2,2) = 0.5;
%
%  Recurrence coefficients for the monic orthogonal polynomials 
%  with respect to the weight function
%    w(x) = 2 * sin ( omega / 2 ) / sqrt ( 1 - sin^2 ( omega / 2 ) * x^2 )
%  by the modified Chebyshev algorithm.
%
% ab = chebyshev ( NN + 1, mom, abm );
  ab = fast_chebyshev ( NN, mom, abm );

  return
end
function ab = fast_chebyshev ( N, mom, abm )

%*****************************************************************************80
%
%% SUBP_MOD_CHEBYSHEV carries out a modified Chebyshev algorithm.
%
%  Discussion:
%
%    This works only for the subperiodic weight function.
%
%    This is a simplified version of a routine by Walter Gautschi.
%
%  Modified:
%
%    19 May 2013
%
%  Parameters:
%
%    Input, integer N, ?
%
%    Input, real MOM(2*N), ?
%
%    Input, real ABM(?), ?
%
%    Output, real AB(N,2), ?
%
  ab = zeros(N,2);
  sig = zeros(N+1,2*N);

  ab(1,2) = mom(1);

  sig(1,1:2*N) = 0; 
  sig(2,:) = mom(1:2*N);

  for n = 3:N+1
    for m = n-1:2*N-n+2
      sig(n,m) = sig(n-1,m+1) + abm(m,2) * sig(n-1,m-1) - ab(n-2,2) * sig(n-2,m);
    end
 
    ab(n-1,2) = sig(n,n-1) / sig(n-1,n-2);
  end

  return
end
function mom = fast_moments_computation ( omega, n )

%*****************************************************************************80
%
%% FAST_MOMENTS_COMPUTATION computes the moments.
%
%  Modified:
%
%    19 May 2013
%
%  Parameters:
%
%    Input, real OMEGA, the arc angle.
%
%    Input, integer N, the index of the highest moment to compute.
%
%    Output, real MOM(1,N+1), the 0-th through N-th moments.
%
  mom = zeros(1,n+1);
%
%  Set the first moment.
%
  mom(1) = 2.0 * omega;

  if ( 2 <= n )

    if ( omega <= 1/4*pi)
      l = 10;
    elseif ( omega <= 1/2*pi)
      l = 20;
    elseif ( omega <= 3/4*pi)
      l = 40;
    elseif ( omega == pi )
      l = 2*ceil(10*pi);
    else
      l = 2*ceil(10*pi/(pi-omega));
    end
%
%  Auxilliary vectors.
%
    temp=(2:2:n+2*l-2);
    temp2=temp.^2-1;
%
%  Diagonals.
%
    dl = 1/4 -1./(4*(temp-1));
    dc = 1/2 -1/sin(omega/2)^2 -1./(2*temp2);
    du = 1/4 +1./(4*(temp+1));

    d = 4*cos(omega/2)/sin(omega/2)./temp2';
    d(end) = d(end);
%
%  Solve the tridiagonal system.
%
    z = tridisolve ( dl(2:end), dc, du(1:end-1 ), d );
%
%  Set the odd moments.
%
    mom(3:2:n+1) = z(1:floor(n/2));

  end

  mom = mom';
%
%  Normalize.
%
  M = length ( mom );
  kk = 2.^(-((1:2:M)-2))';
  kk(1) = 1;
  v = ones(M,1);
  v(1:2:M) = kk;
  mom = v .* mom;

  return
end
function xw = SymmMw ( N, ab )

%*****************************************************************************80
%
%% SYMMMW computes a quadrature rule for a symmetric weight function.
%
%  Discussion:
%
%    This function uses the reduced matrix and eig and
%    computation of weights with the 3-term recurrence.
%
%  Modified:
%
%    19 May 2013
%
%  Author:
%
%    Gerard Meurant, Alvise Sommariva
%
%  Reference:
%
%    Gerard Meurant, Alvise Sommariva,
%    Fast variants of the Golub and Welsch algorithm for symmetric 
%    weight functions,
%    Submitted, 2012.
%
%  Parameters:
%
%    Input, integer N, the cardinality of the rule.
%
%    Input, real AB(*,2), the 3-term recurrence for the orthogonal polynomials
%    same as in OPQ.  Note that AB(1,2) is the 0th moment.
%
%    Output, real XW(N,2), the nodes and weights of the quadrature rule.
%
  N0 = size ( ab, 1 );

  if ( N0 < N )
    error('SymmMw: input array ab is too short')
  end

  na = norm(ab(:,1));

  if na > 0
    error('SymmMw: the weight function must be symmetric')
  end
%
%  Computation of the reduced matrix in vectors (a,b)
%
  if mod(N,2) == 0
    even = 1;
    Nc = N / 2;
  else
    even = 0;
    Nc = fix(N / 2) +1;
  end

  absd = ab(:,2);
  absq = sqrt(absd);

  a = zeros(1,Nc);
  b = a;

  switch even
    case 1
        % N even
        a(1) = absd(2);
        b(1) = absq(2) * absq(3);
 
        k = (2:Nc-1);
        a(k) = absd(2*k-1) + absd(2*k);
        b(k) = absq(2*k) .* absq(2*k+1);
        a(Nc) = absd(N) + absd(N-1);
        start = 1;
        
       J = diag(a) + diag(b(1:Nc-1),1) + diag(b(1:Nc-1),-1);
       t = sort(eig(J));
       w = weights_3t(t',a,b);
%
% w are the squares of the first components
%
       w = w' / 2;
    case 0
        % N odd
        a(1) = absd(2);
        b(1) = absq(2) * absq(3);
        
        k = (2:Nc-1);
        a(k) = absd(2*k-1) + absd(2*k);
        b(k) = absq(2*k) .* absq(2*k+1);
        a(Nc) = absd(N);
        start = 2;
%
%  the first node must be zero
%
        J = diag(a) + diag(b(1:Nc-1),1) + diag(b(1:Nc-1),-1);
        t = sort(eig(J));
        t(1) = 0;
        w = weights_3t(t',a,b);
        w = [w(1); w(2:end)' / 2];
    otherwise
        error('this is not possible')
  end

  xwp = sqrt(t);

  xw(:,1) = [-xwp(end:-1:start,1); xwp];
  xw(:,2) = ab(1,2) * ([w(end:-1:start); w]);

  return
end
function tw = trigauss_conversion ( xw, omega )

%*****************************************************************************80
%
%% TRIGAUSS_CONVERSION ???
%
%  Modified:
%
%    19 May 2013
%
%  Author:
%
%    Gaspare Da Fies, Alvise Sommariva, Marco Vianello
%
%  Parameters:
%
%    Input, real XW(?,2), ?
%
%    Input, real OMEGA, the arc angle.
%
%    Output, real TW(?,2), the angles and weights for the trigonometic
%    quadrature rule.
%
  tw(:,1) = 2.0 * asin ( sin ( omega / 2.0 ) * xw(:,1) );
  tw(:,2) = xw(:,2);

  return
end
function w = weights_3t ( t, a, b )

%*****************************************************************************80
%
%% WEIGHTS_3T computes squares of the 1st components of eigenvectors.
%
%  Discussion:
%
%    The results are computed from the 3-term recurrence relation of 
%    the orthogonal polynomials.
%
%  Modified:
%
%    19 May 2013
%
%  Author:
%
%    Gerard Meurant, Alvise Sommariva
%
%  Parameters:
%
%    Input, real T(N), the nodes.
%
%    Input, real A(N-1), B(N-1), the coefficients of the 3-term recurrence.
%
%    Output, real W(N), the squares of the first components of the eigenvectors.
%
  n = length ( t );

  P = zeros ( n, n );
  P(1,:) = ones ( 1, n );
  P(2,:) = ( t - a(1) ) / b(1);

  for k = 3 : n
    k1 = k - 1;
    k2 = k - 2;
    P(k,:) = ( ( t - a(k1) ) .* P(k1,:) - b(k2) * P(k2,:) ) / b(k1);
  end

  P2 = P .* P;

  w = 1.0 ./ sum ( P2 );

  return
end
