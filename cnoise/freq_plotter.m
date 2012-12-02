function freq_plotter ( RN, N, dorun, filename )

%*****************************************************************************80
%
%% FREQ_PLOTTER computes and plots the frequency distribution of discrete noise.
%
% freq_plotter: performs numerical test on the frequency distribution of
%               discrete approximations to continuous noise field
%
%  YOU SHOUD EDIT: pick which of the three f_alpha functions are to be used
%                  this is in parfor_freq_plotter_perform_freq_test sub-function
%
%  You can safely edit the five values of alpha, although you should keep size( alpha ) == [ 1, 5 ];
%  You can also edit normalize_factors in the same manner (this is used input to f_alpha)
%  You can also edit plot_interval for which frequencies are to be plotted
%
%    Usage: freq_plotter( RN, N, dorun, filename )
%       RN: the number of sample realizations to be generated (i.e. 10000)
%        N: the size of the problem
%    dorun: 1 means "perform the simulation", 0 means "load a saved file"
% filename: data is saved/loaded from filename
%
%  EXAMPLE: 
%           freq_plotter( 10000, 1000, 1, 'Test10K1K' ) 
%       this will gather statistics from 10000 realizations of noise field 
%       approximations of size 1000, the result will be stored in Test10K1K.m
%
%       You can then call:
%                      freq_plotter( 10000, 1000, 0, 'Test10K1K' )
%             to plot the results without the need to redo the computation
%        
%  NOTE:
%   This code used parfor loops, which means that you can call this
%   function after making the appropriate call to (depending on the number
%   of CPU cores on your machine)
%          matlabpool open local 2
%          matlabpool open local 4
%          matlabpool open local 6
%  This will take advantage of up to 5 cores at a time (the simulation will
%    run will be much faster)
%  This feature requires the parallel toolbox
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 March 2011
%
%  Author:
%
%    Miroslav Stoyanov
%
%  Reference:
%
%    Jeremy Kasdin,
%    Discrete Simulation of Colored Noise and Stochastic Processes
%    and 1/f^a Power Law Noise Generation,
%    Proceedings of the IEEE,
%    Volume 83, Number 5, 1995, pages 802-827.
%    
%    Miroslav Stoyanov, Max Gunzburger, John Burkardt,
%    Pink Noise, 1/F^Alpha Noise, and Their Effect on Solution
%    of Differential Equations,
%    submitted, International Journal for Uncertainty Quantification.
%

% --- Parameters

  normalize_factors = ones( 1, 5 );
  alpha = [ 0, 0.5, 1, 1.5, 2 ];
    
  plot_interval = 1:N-1;

% ---------------    

  if ( nargin < 3 )
    dorun = 1;
  end;

  if ( nargin < 4 )
    filename = 'defultFilenameForRun';
  end;


  if ( dorun == 1 )

    disp([' Performing computation ... ']);
    
    parfor i = 1:5
        if ( i == 1 )
            parfor_freq_plotter_perform_freq_test( RN, N, alpha(i), normalize_factors(i), 'ffreq_test_1' );
        elseif ( i == 2 )
            parfor_freq_plotter_perform_freq_test( RN, N, alpha(i), normalize_factors(i), 'ffreq_test_2' );
        elseif ( i == 3 )
            parfor_freq_plotter_perform_freq_test( RN, N, alpha(i), normalize_factors(i), 'ffreq_test_3' );
        elseif ( i == 4 )
            parfor_freq_plotter_perform_freq_test( RN, N, alpha(i), normalize_factors(i), 'ffreq_test_4' );
        elseif ( i == 5 )
            parfor_freq_plotter_perform_freq_test( RN, N, alpha(i), normalize_factors(i), 'ffreq_test_5' );
        end;
    end;

    load( 'ffreq_test_1' ); freq_test_1 = freq_test;
    load( 'ffreq_test_2' ); freq_test_2 = freq_test;
    load( 'ffreq_test_3' ); freq_test_3 = freq_test;
    load( 'ffreq_test_4' ); freq_test_4 = freq_test;
    load( 'ffreq_test_5' ); freq_test_5 = freq_test;
    
    save ( filename, 'RN', 'N', 'normalize_factors', 'alpha', 'freq_test_1', ,,,
      'freq_test_2', 'freq_test_3', 'freq_test_4', 'freq_test_5' );
    
  else
    
    disp([' Loading Data ... ']);
    load( filename );
    
  end;

  base_freq = 1:N;

  base_freq = base_freq( plot_interval );
  freq_test_1 = freq_test_1( plot_interval );
  freq_test_2 = freq_test_2( plot_interval );
  freq_test_3 = freq_test_3( plot_interval );
  freq_test_4 = freq_test_4( plot_interval );
  freq_test_5 = freq_test_5( plot_interval );

  loglog ( base_freq, freq_test_1, ...
           base_freq, freq_test_2, '--', ...
           base_freq, freq_test_3, '-x', ...
           base_freq, freq_test_4, '-o', ...
           base_freq, freq_test_5, '-*' );

  lh = legend ( '$\alpha=0$', ...
                '$\alpha=0.5$', ...
                '$\alpha=1$', ...
                '$\alpha=1.5$', ...
                '$\alpha=2$' );

  set ( lh, 'FontSize', 16, 'Interpreter', 'latex' );

  return
end

function freq_test = parfor_freq_plotter_perform_freq_test ( RN, N, alpha, ...
  variance, filename_to_save )

%*****************************************************************************80
%
%% PARFOR_FREQ_PLOTTER_PERFORM_FREQ_TEST...
%
%  Set the projection matrix V.
%
  dist = 3;

  V = zeros ( N, N );
  x = 1/(2*N) : 1/N : 1-1/(2*N);
  dx = 1 / N;
  for i = 1:N
    V(:,i) = dx * cos ( ( i - 1 ) * pi * x' );
  end;
%
%  Do the realizations.
%
  freq_per_run = zeros( RN, N );
  scale_c_alpha = ( N^( (1-alpha) / 2 ) );

  for i = 1 : RN
%
%  DIST = 1: use zero-mean Gaussian with variance = variance
%
    if ( dist == 1 )

      [ noise ] = scale_c_alpha * f_alpha_gaussian( N, variance, alpha );
%
%  DIST = 2: use truncated gaussian with variance = variance, and range 10.
%
    elseif ( dist == 2 )

      r = 10.0;
      [ noise ] = scale_c_alpha * f_alpha_tgaussian( N, variance, r, alpha);
%
%  DIST = 3: use uniform distribution on (-variance,variance)
%
    else

      [ noise ] = scale_c_alpha * f_alpha_uniform( N, variance, alpha); 
 
    end

    freq_per_run(i,:) = noise' * V;
    freq_per_run(i,:) = abs( freq_per_run(i,:) ).^2;

  end

  freq_test = mean( freq_per_run );

  if ( nargin == 5 )
    save ( filename_to_save, 'freq_test' );
  end

  return
end
