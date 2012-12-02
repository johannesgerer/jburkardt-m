function cvt_1d_sampling ( n, it_num, s_num )

%*****************************************************************************80
%
%% CVT_1D_SAMPLING carries out the Lloyd algorithm.
%
%  Discussion:
%
%    This program is a variation of the CVT_1D_LLOYD method.
%    Instead of using an exact technique to determine the Voronoi
%    regions, it uses sampling.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of generators.
%
%    Input, integer IT_NUM, the number of CVT iterations.
%
%    Input, integer S_NUM, the number of samples in [0,1] to use
%    when estimating the Voronoi regions.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_1D_SAMPLING\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Use sampling to implement an approximation of Lloyd''s algorithm\n' );
  fprintf ( 1, '  in the 1D unit interval [0,1].\n' );

  if ( nargin < 1 )
    n = input ( '  Enter number of generators: ' );
  end

  if ( nargin < 2 ) 
    it_num = input ( '  Enter number of iterations: ' );
  end

  if ( nargin < 3 ) 
    s_num = input ( '  Enter number of sample points: ' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of generators is %d\n', n );
  fprintf ( 1, '  Number of iterations is %d\n', it_num );
  fprintf ( 1, '  Number of samples is %d\n', s_num );
%
%  For convenience, add a 0.0 and 1.0 point.
%  Also, sort the array.
%
  g = zeros ( n + 2, 1 );
  g_new = zeros ( n + 2, 1 );

  g(1,1) = 0.0;
  if ( 0 )
    g(2:n+1,1) = rand ( n, 1 );
  else
    g(2:n+1,1) = linspace ( 0.01, 0.02, n );
  end
  g(n+2,1) = 1.0;

  g = sort ( g );
%
%  Print the initial generators.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial generators:\n' );
  fprintf ( 1, '\n' );
  for k = 2 : n + 1
    fprintf ( 1, '  %4d  %f\n', k - 1, g(k,1) );
  end
%
%  Initialize the plotting arrays.
%
  g_plot = zeros ( n+2, it_num + 1 );

  step = 1 : it_num;
  e = nan ( it_num, 1 );
  gm = nan ( it_num, 1 );

  for it = 1 : it_num

    g_plot ( 1:n+2, it ) = g(1:n+2,1);

    s = rand ( s_num, 1 );
%
%  We need to "assign" each entry of S to the nearest X, then
%  replace X by the average of the values assigned to it.
%
%  There's a faster way for this 1D case.
%  1) Sort the S values.
%  2) Determine the values XM that delimit the Voronoi intervals.
%  3) For each XM, find the index LEFT in S such that S(LEFT) <= XM < S(LEFT+1).
%  4) Replace X(I) by the average of the S values that you have determined
%     are within its Voronoi interval.
%
    s = sort ( s );

    xm = zeros ( n - 1, 1 );
    for j = 1 : n - 1
      xm(j) = 0.5 * ( g(j+1) + g(j+2) );
    end

    left = r8vec_bracket4 ( s_num, s, n - 1, xm );
%
%  Compute the new generators.
%
    e(it,1) = 0.0;

    j = 1;
    g_new(j) = 0.0;

    k2 = 0;
    for j = 1 : n - 1
      k1 = k2;
      k2 = left(j);
      g_new(j+1) = sum ( s(k1+1:k2) ) / ( k2 - k1 );
      for k = k1 + 1 : k2
        e(it,1) = e(it,1) + ( s(k) - g(j+1) ).^2;
      end
    end

    k1 = k2;
    k2 = s_num;
    j = n + 1;
    g_new(j) = sum ( s(k1+1:k2) ) / ( k2 - k1 );
    for k = k1 + 1 : k2
      e(it,1) = e(it,1) + ( s(k) - g(j) ).^2;
    end

    j = n + 2;
    g_new(j) = 1.0;

    e(it,1) = e(it,1) / s_num;
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
    gm(it,1) = sum ( ( g_new(:) - g(:) ).^2 ) / n;
%
%  Display the generator motion.
%
    figure ( 2 )
    plot ( step, log ( gm ), 'm-*' )
    title ( 'Log (Average generator motion)' )
    xlabel ( 'Step' )
    ylabel ( 'Motion' )
    grid
%
%  Update the generators.
%
    g = g_new;

  end

  g_plot(1:n+2,it_num+1) = g(1:n+2,1);

%
%  Print the current generators.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Current generators:\n' );
  fprintf ( 1, '\n' );
  for k = 2 : n + 1
    fprintf ( 1, '  %4d  %f\n', k - 1, g(k,1) );
  end
%
%  Plot the evolution of the locations of the generators.
%
  figure ( 3 )
  y = ( 0 : it_num );
  for k = 1 : n + 2
    plot ( g_plot(k,1:it_num+1), y )
    hold on;
  end
  grid on
  hold off;

  title ( 'Generator evolution' );
  xlabel ( 'Generator positions' );
  ylabel ( 'Iterations' ); 
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_1D_SAMPLING\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function left = r8vec_bracket4 ( nt, t, ns, s )

%*****************************************************************************80
%
%% R8VEC_BRACKET4 finds the interval to each of a vector of values.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%    The routine always returns the index LEFT of the sorted array
%    T with the property that either
%    *  T is contained in the interval [ T(LEFT), T(LEFT+1) ], or
%    *  T < T(LEFT) = T(1), or
%    *  T > T(LEFT+1) = T(N).
%
%    The routine is useful for interpolation problems, where
%    the abscissa must be located within an interval of data
%    abscissas for interpolation, or the "nearest" interval
%    to the (extreme) abscissa must be found so that extrapolation
%    can be carried out.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    30 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NT, length of the input array.
%
%    Input, real T(NT), an array that has been sorted
%    into ascending order.
%
%    Input, integer NS, the number of points to be bracketed.
%
%    Input, real S(NS), values to be bracketed by entries of T.
%
%    Output, integer LEFT(NS).
%    LEFT(I) is set so that the interval [ T(LEFT(I)), T(LEFT(I)+1) ]
%    is the closest to S(I); it either contains S(I), or else S(I)
%    lies outside the interval [ T(1), T(NT) ].
%

%
%  Check the input data.
%
  if ( nt < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_BRACKET4 - Fatal error!\n' );
    fprintf ( 1, '  NT must be at least 2.\n' );
    error ( 'R8VEC_BRACKET4 - Fatal error!' );
  end

  for i = 1 : ns

    left(i) = floor ( ( nt + 1 ) / 2 );
%
%  CASE 1: S < T(LEFT):
%  Search for S in [T(I), T(I+1)] for intervals I = 1 to LEFT-1.
%
    if ( s(i) < t(left(i)) )

      if ( left(i) == 1 )
        continue
      elseif ( left(i) == 2 )
        left(i) = 1;
        continue
      elseif ( t(left(i)-1) <= s(i) )
        left(i) = left(i) - 1;
        continue
      elseif ( s(i) <= t(2) )
        left(i) = 1;
        continue
      end
%
%  ...Binary search for S in [T(I), T(I+1)] for intervals I = 2 to LEFT-2.
%
      low = 2;
      high = left(i) - 2;

      while ( 1 )
  
        if ( low == high )
          left(i) = low;
          break
        end

        mid = floor ( ( low + high + 1 ) / 2 );

        if ( t(mid) <= s(i) )
          low = mid;
        else
          high = mid - 1;
        end

      end
%
%  CASE2: T(LEFT+1) < S:
%  Search for S in [T(I),T(I+1)] for intervals I = LEFT+1 to N-1.
%
    elseif ( t(left(i)+1) < s(i) )

      if ( left(i) == nt - 1 )
        continue
      elseif ( left(i) == nt - 2 )
        left(i) = left(i) + 1;
        continue
      elseif ( s(i) <= t(left(i)+2) )
        left(i) = left(i) + 1;
        continue
      elseif ( t(nt-1) <= s(i) )
        left(i) = nt - 1;
        continue
      end
%
%  ...Binary search for S in [T(I), T(I+1)] for intervals I = LEFT+2 to NT-2.
%
      low = left(i) + 2;
      high = nt - 2;

      while ( 1 )

        if ( low == high )
          left(i) = low;
          break
        end

        mid = floor ( ( low + high + 1 ) / 2 );

        if ( t(mid) <= s(i) )
          low = mid;
        else
          high = mid - 1;
        end

      end
%
%  CASE3: T(LEFT) <= S <= T(LEFT+1):
%  S is in [T(LEFT), T(LEFT+1)].
%
    else

    end

  end

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
