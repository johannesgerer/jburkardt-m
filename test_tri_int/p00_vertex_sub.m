function  [ result, n ] = p00_vertex_sub ( problem, level, n, result )

%*****************************************************************************80
%
%% P00_VERTEX_SUB approximates an integral in a triangle by subdivision.
%
%  Discussion:
%
%    The function f(x,y) is to be integrated over a triangle T.
%
%    The first approximation averages the values at the vertices.
%
%    If a second approximation is requested, the routine subdivides each
%    existing triangle into 4, evaluates the function at the new vertices,
%    and returns an improved estimate.
%
%    The routine may be called repeatedly in this way, to get an improved
%    estimate of the integral.
%
%    Note that this routine will fail in the case that there
%    are singularities at the vertices or along the sides of the triangle.
%
%    Moreover, since the number of new vertices grows as a power of 4,
%    the use of an automatic array to store all the new vertices at one
%    time may fail when a memory limit is reached.
%
%    Finally, note that the rule has a very low order of convergence.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 April 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem index.
%
%    Input, integer LEVEL, the level of subdivision.  The first call
%    should be with LEVEL = 0.  For successive refinement, the routine
%    may be called repeatedly.  Each time, the user should increase the
%    value of LEVEL by 1, and also input the value of RESULT that was
%    output on the previous call.
%
%    Input, integer N, the number of function evaluations used.
%    If LEVEL = 0, the input value is ignored.  Otherwise, the input
%    value is assumed to be the output value from the previous call.
%
%    Input, real RESULT, the approximate integral.
%    If LEVEL = 0, then the input value is ignored.  Otherwise, the
%    input value is assumed to be the result from the previous call,
%    at the previous level.  
%
%    Output, integer N, the number of function evaluations used,
%    including function evaluations from previous levels.
%
%    Output, real RESULT, the updated approximate integral, based on the input
%    value, adjusted by information determined at the new level.
%
  persistent area;
  persistent t;
%
%  Compute first level.
%
  if ( level == 0 )
 
    t = p00_vertices ( problem );
    area = triangle_area ( t );

    n = 3;

    f = p00_fun ( problem, n, t );

    result = sum ( f(1:n) ) * area / 3.0;
%
%  Compute next level.
%
  else

    if ( level == 1 )
      n_new = 3;
    else
      n_new = ( 2^(level-1) + 1 ) * 2^(level-1) * 3;
    end

    order_max_1d = 2^level;

    n_new = 0;

    for i = 0 : 2 : order_max_1d - 1
      for j = 0 : 2 : order_max_1d - 1 - i
 
        n_new = n_new + 1;

        xsi(1,1) = ( order_max_1d - i - 1 - j ) / ( order_max_1d );
        xsi(2,1) = (                i + 1     ) / ( order_max_1d );
        xsi(3,1) = (                        j ) / ( order_max_1d );

        p(1:2,n_new) = t(1:2,1:3) * xsi(1:3,1);

        n_new = n_new + 1;

        xsi(1,1) = ( order_max_1d - i - j - 1 ) / ( order_max_1d );
        xsi(2,1) = (                i         ) / ( order_max_1d );
        xsi(3,1) = (                    j + 1 ) / ( order_max_1d );

        p(1:2,n_new) = t(1:2,1:3) * xsi(1:3,1);

        n_new = n_new + 1;

        xsi(1,1) = ( order_max_1d - i - 1 - j - 1 ) / ( order_max_1d );
        xsi(2,1) = (                i + 1         ) / ( order_max_1d );
        xsi(3,1) = (                        j + 1 ) / ( order_max_1d );

        p(1:2,n_new) = t(1:2,1:3) * xsi(1:3,1);

      end
    end

    f(1:n_new) = p00_fun ( problem, n_new, p );

    result_new = sum ( f(1:n_new) ) * area / n_new;

    result = ( 3.0 * result_new + result ) / 4.0;

    n = n + n_new;

  end

  return
end
