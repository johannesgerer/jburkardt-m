function x = line_cvt_lloyd ( n, a, b, it_num, header, x )

%*****************************************************************************80
%
%% LINE_CVT_LLOYD carries out the Lloyd algorithm.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of generators.
%
%    Input, real A, B, the left and right endpoints.
%
%    Input, integer IT_NUM, the number of iterations to take.
%
%    Input, string HEADER, an identifying string.
%
%    Input, real X(N), the initial point locations.
%
%    Output, real X(N), the final point locations.
%
  x = x(:);
%
%  Print the initial generators.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial generators:\n' );
  fprintf ( 1, '\n' );
  for k = 1 : n
    fprintf ( 1, '  %4d  %f\n', k, x(k,1) );
  end
%
%  Initialize the plotting arrays.
%
  step = 1 : it_num;
  e = nan ( it_num, 1 );
  xm = nan ( it_num, 1 );

  for it = 1 : it_num

    x_plot ( 1:n, it ) = x(1:n,1);

    x_new = line_cvt_lloyd_step ( n, a, b, x );

    e(it) = line_cvt_energy ( n, a, b, x );
    e(it) = max ( e(it), eps );
%
%  Display the energy.
%
    figure ( 1 )
    plot ( step, log ( e ), 'm-*' )
    title ( 'Log (Energy)' )
    xlabel ( 'Step' )
    ylabel ( 'Energy' )
    grid
%
%  Compute the generator motion.
%
    xm(it,1) = sum ( ( x_new(:) - x(:) ).^2 ) / n;
%
%  Display the generator motion.
%
    figure ( 2 )
    plot ( step, log ( xm ), 'm-*' )
    title ( 'Log (Average generator motion)' )
    xlabel ( 'Step' )
    ylabel ( 'Motion' )
    grid
%
%  Update the generators.
%
    x(1:n,1) = x_new(1:n,1);
    
  end

  x_plot(1:n,it_num+1) = x(1:n,1);
%
%  Print the current generators.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Current generators:\n' );
  fprintf ( 1, '\n' );
  for k = 1 : n
    fprintf ( 1, '  %4d  %f\n', k, x(k,1) );
  end
%
%  Plot the evolution of the locations of the generators.
%
  figure ( 3 )

  y = ( 0 : it_num );
  for k = 1 : n
    plot ( x_plot(k,1:it_num+1), y )
    hold on;
  end
  grid on
  hold off;

  title ( 'Generator evolution.' );
  xlabel ( 'Generator positions' );
  ylabel ( 'Iterations' ); 
%
%  Save the plots.
%
  figure ( 1 )
  filename = strcat ( header, '_energy.png' );
  print ( '-dpng', filename );
  figure ( 2 )
  filename = strcat ( header, '_motion.png' );
  print ( '-dpng', filename );
  figure ( 3 )
  filename = strcat ( header, '_evolution.png' );
  print ( '-dpng', filename );

  return
end

