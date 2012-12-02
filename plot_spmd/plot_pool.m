%% PLOT_POOL demonstrates MATLAB's SPMD command for parallel programming.
%
%  Discussion:
%
%    This is a very simple, but suggestive, example of how SPMD works.
%
%    We wish to compute and plot values of the sine function over the
%    range [0,2 pi].
%
%    We have available N "labs", that is, assistant copies of MATLAB.
%
%    We divide the range into N equal parts, and have each lab evaluate
%    the sine function at 100 points in its range.
%
%    Then the client copy of MATLAB issues a sequence of plot commands
%    that assemble all the computed data into one image.
%
%    Alternating colors are used for the data computed by each lab,
%    which helps to illustrate the fact that a single computation has
%    been carried out by cooperating labs, and assembled by the client.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 March 2010
%
%  Author:
%
%    John Burkardt
%    Gene Cliff
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PLOT_POOL\n' );
  fprintf ( 1, '  Demonstrate the use of MATLAB''s SPMD command\n' );
  fprintf ( 1, '  to carry out a parallel computation.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Have each worker compute part of a sine curve:\n' );
  fprintf ( 1, '  Have the client assemble the data and plot it.\n' );
  fprintf ( 1, '\n' );

  n = 4;

  matlabpool ( 'open', 'local', n );

  [ X, Y ] = plot_fun ( );

  matlabpool close
%
%  Plot the sine curve.
%
  color = [ 'r', 'g', 'b', 'c', 'y', 'm', 'k' ];

  figure

  hold on
  for i = 1 : n
    c = color ( mod ( i - 1, 7 ) + 1 );
    plot ( X(i,:), Y(i,:), c, 'LineWidth', 3 );
    plot ( [2*pi*i/n,2*pi*i/n], [-1,+1], 'k' );
  end

  xlabel ( 'X' )
  ylabel ( 'Y' )
  plot_title = sprintf ( 'Sine curve plotted by %d SPMD workers', n );
  title ( plot_title )

  hold off
