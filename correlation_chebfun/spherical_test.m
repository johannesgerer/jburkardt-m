function spherical_test ( )

%*****************************************************************************80
%
%% SPHERICAL_TEST examines the spherical correlation.
%
%  Discussion:
%
%    No convergence, even with EIGEN_NUM down to 3.
%
%    This code is based substantially on a document by Toby Driscoll.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Toby Driscoll,
%    Mercer's theorem and the Karhunen-Loeve expansion,
%    Oxford University Mathematical Institute,
%    http://www2.maths.ox.ac.uk/chebfun/examples/stats/pdf/MercerKarhunenLoeve.pdf
%
  rmpath ( '/usr/local/matlab/toolbox/datafeed/datafeed' )
  addpath ( '../chebfun' )

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERICAL_TEST:\n' );
  fprintf ( 1, '  Demonstrate Mercer''s theorem and the KL expansion\n' );
  fprintf ( 1, '  for the spherical kernel.\n' );
%
%  Set the interval.
%
  a = 0.0;
  b = 1.0;
  fprintf ( 1, '  Using interval [%g,%g]\n', a, b );
  s_num = 21;
  s_vec = linspace ( a, b, s_num );
%
%  FRED is a function from the CHEBFUN library.
%
%  It constructs a "chebop" representing the Fredholm integral operator
%  with kernel K for functions in domain [A,B].
%
  F = fred ( @spherical_correlation, domain ( [ a, b ] ) );
%
%  EIGS has been extended to be able to compute the eigenvalues Lambda
%  and eigenfunctions Psi of the Fredholm integral operator represented by F.
%
%  The "LM" switch requests that we return the eigenvalues of largest magnitude.
%
%  Each Psi is a CHEBFUN, that is, it takes a real number argument.
%
  eigen_num = 20;
  [ Psi, Lambda ] = eigs ( F, eigen_num, 'lm' );

  eigen_found = length ( Lambda );
  fprintf ( 1, '  Requested %d eigenmodes, computed %d\n', eigen_num, eigen_found );
  eigen_num = min ( eigen_num, eigen_found );
%
%  Print the eigenvalues.
%
  lambda_vec = diag ( Lambda );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I       Lambda(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : eigen_num
    fprintf ( 1, '  %2d  %10g\n', i, lambda_vec(i) );
  end
%
%  Plot the eigenvalues.
%
  figure ( 1 )
  clf
  plot ( lambda_vec, 'Linewidth', 2 );
  hold on
  plot ( lambda_vec, 'b.', 'Markersize', 20 );
  title ( 'spherical: Mercer eigenvalues' );
  xlabel ( '<--- N --->')
  grid on
  print -dpng 'spherical_figure1.png'
%
%  Plot selected eigenfunctions.
%
  figure ( 2 )
  subplot ( 4, 1, 1 )
  plot ( Psi(:,1), 'Linewidth', 2 );
  title ( 'spherical: Mercer eigenfunction PSI(1)' )
  grid on
  if ( 2 <= eigen_num )
    subplot ( 4, 1, 2 )
    plot ( Psi(:,2), 'Linewidth', 2 );
    title ( 'spherical: Mercer eigenfunction PSI(2)' )
    grid on
  end
  if ( 3 <= eigen_num )
    subplot ( 4, 1, 3 )
    plot ( Psi(:,3), 'Linewidth', 2 );
    title ( 'spherical: Mercer eigenfunction PSI(3)' )
    grid on
  end
  if ( 4 <= eigen_num )
    subplot ( 4, 1, 4 )
    plot ( Psi(:,4), 'Linewidth', 2 );
    title ( 'spherical: Mercer eigenfunction PSI(4)' )
    grid on
  end
  print -dpng 'spherical_figure2.png'
%
%  Orthonormality check.
%
  ptp = Psi' * Psi;
  error_frobenius = r8mat_is_identity ( eigen_num, ptp );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Frobenius norm of I - Psi'' * Psi = %g\n', error_frobenius );
%
%  K(S,S) should be exactly 1.
%  Because we are using a truncated representation of K, our estimate of K(S,S)
%  will be smaller than 1.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Truncated estimate of K(s,s) = 1 for S in the interval.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        S        K(s,s) estimate\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 21
    s = s_vec(i);
    ptlp = Psi(s,:) * Lambda * Psi(s,:)';
    fprintf ( 1, '  %10g  %14g\n', s, ptlp );
  end
%
%  Look at eigenvalue decay.
%
  x = diff ( log ( ( 1:eigen_num ) ) );
  y = diff ( log ( lambda_vec ) )';
  c = y ./ x;
  figure ( 3 );
  clf
  plot ( c, 'Linewidth', 2 );
  grid on
  hold on
  plot ( c, 'b.', 'Markersize', 20 );
  xlabel ( '<-- N -->' )
  title ( 'spherical: Eigenvalue decay rate' );
  print -dpng 'spherical_figure3.png'
%
%  Look at eigenvalue sum.
%
%  The trace of K(s,s) over [a,b] should be the integral of 1 over [a,b],
%  that is, b - a.
%
%  We compare the trace to the partial sums of the lambda's to see how much
%  of the variance of the process we have captured.
%
  trace_K = b - a;
  lambda_cum = cumsum ( lambda_vec ) / trace_K;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Index    Cumulative Eigenvalue sum\n' );
  fprintf ( 1, '\n' );
  for i = 1 : eigen_num
    fprintf ( 1, '  %5d  %10g\n', i, lambda_cum(i) );
  end
%
%  We decide to use the first 10 eigenfunctions.
%
  eigen_use = min ( 10, eigen_num );
%
%  Find 400 realizations of the process by selecting, for each realization,
%  10 random parameters Z in the truncated KL expansion.
%
  Z = randn ( eigen_use, 400 );
  X = Psi(:,1:eigen_use) * ( sqrt ( Lambda(1:eigen_use,1:eigen_use) ) * Z ); 
%
%  Plot 40 of the realizations;
%  Plot their mean, computed from all 400.
%
  figure ( 4 )
  clf
  plot ( X(:,1:40) )
  mu = sum ( X, 2 ) / 400;
  hold on;
  plot ( mu, 'k', 'linewidth', 3 );
  title ( 'spherical: 40 Random Realizations X(t,omega), and their Mean.' )
  print -dpng 'spherical_figure4.png'
%
%  Estimate the covariance from the data.
%
  figure ( 5 )
  clf
  [ S, T ] = meshgrid ( s_vec, s_vec );
  C = cov ( X(s_vec,:)' );
  mesh ( S, T, C );
  hold on;
  D = spherical_correlation ( S, T );
  plot3 ( S, T, D, 'k.', 'markersize', 10 )
  title ( 'spherical: Covariance K(S,T) (dots), and Estimate from Realizations (mesh)' )
  print -dpng 'spherical_figure5.png'
%
%  Using just 10 functions in the expansion,
%  reduce the correlation length,
%  and examine the sum of the lambda's.
%
  if ( 0 )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use a fixed number of eigenfunctions = %d\n', eigen_use );
  fprintf ( 1, '  but vary the correlation length RHOBAR.\n' );
  fprintf ( 1, '  (We used RHOBAR = 1 above.)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The sum of the eigenvalues, divided by (B-A),\n' );
  fprintf ( 1, '  discloses the relative amount of the total variation\n' );
  fprintf ( 1, '  that is captured by the truncated expansion.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      RHOBAR      VARSUM\n' );
  fprintf ( 1, '\n' );
  rhobar = 4.0;
  for i = 1 : 10
    K = @ ( s, t ) exp ( - abs ( s - t ) / rhobar );
    F = fred ( K, domain ( [ a, b ] ) );
    lambda_vec = eigs ( F, eigen_num, 'lm' );
    varsum = sum ( lambda_vec(1:eigen_use) ) / ( b - a );
    fprintf ( 1, '  %10g  %10g\n', rhobar, varsum );
    rhobar = rhobar / 2.0;
  end

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERICAL_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../chebfun' )

  return
end
