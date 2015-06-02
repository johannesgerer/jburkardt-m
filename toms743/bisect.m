function [ value, ner ] = bisect ( xx, nb, l )

%*****************************************************************************80
%
%% BISECT approximates the W function using bisection.
%
%  Discussion:
%
%    The parameter TOL, which determines the accuracy of the bisection
%    method, is calculated using NBITS (assuming the final bit is lost
%    due to rounding error).
%
%    N0 is the maximum number of iterations used in the bisection
%    method.
%
%    For XX close to 0 for Wp, the exponential approximation is used.
%    The approximation is exact to O(XX^8) so, depending on the value
%    of NBITS, the range of application of this formula varies. Outside
%    this range, the usual bisection method is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2014
%
%  Author:
%
%    Original FORTRAN77 version by Andrew Barry, S. J. Barry, 
%    Patricia Culligan-Hensley.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Andrew Barry, S. J. Barry, Patricia Culligan-Hensley,
%    Algorithm 743: WAPR - A Fortran routine for calculating real 
%    values of the W-function,
%    ACM Transactions on Mathematical Software,
%    Volume 21, Number 2, June 1995, pages 172-181.
%
%  Parameters:
%
%    Input, real XX, the argument.
%
%    Input, integer NB, indicates the branch of the W function.
%    0, the upper branch;
%    nonzero, the lower branch.
%
%    Input, integer L, the offset indicator.
%    1, XX represents the offset of the argument from -exp(-1).
%    not 1, XX is the actual argument.
%
%    Output, real VALUE, the value of W(X), as determined
%
%    Output, integer NER, the error flag.
%    0, success;
%    1, the routine did not converge.  Perhaps reduce NBITS and try again.
%
  value = 0.0;
  ner = 0;

  n0 = 500;
  nbits = 52;

  if ( l == 1 )
    x = xx - exp ( -1.0 );
  else
    x = xx;
  end

  if ( nb == 0 )

    test = 1.0 / ( 2.0 ^ nbits ) ^ ( 1.0 / 7.0 );

    if ( abs ( x ) < test )

      value = x ...
        * exp ( - x ...
        * exp ( - x ...
        * exp ( - x ...
        * exp ( - x ...
        * exp ( - x ...
        * exp ( - x ))))));

      return

    else

      u = crude ( x, nb ) + 0.001;
      tol = abs ( u ) / 2.0 ^ nbits;
      d = max ( u - 0.002, -1.0 );

      for i = 1 : n0

        r = 0.5 * ( u - d );
        value = d + r;
%
%  Find root using w*exp(w)-x to avoid ln(0) error.
%
        if ( x < exp ( 1.0 ) )

          f = value * exp ( value ) - x;
          fd = d * exp ( d ) - x;
%
%  Find root using ln(w/x)+w to avoid overflow error.
%
        else

          f = log ( value / x ) + value;
          fd = log ( d / x ) + d;

        end

        if ( f == 0.0 )
          return
        end

        if ( abs ( r ) <= tol )
          return
        end

        if ( 0.0 < fd * f )
          d = value;
        else
          u = value;
        end

      end

    end

  else

    d = crude ( x, nb ) - 0.001;
    u = min ( d + 0.002, -1.0 );
    tol = abs ( u ) / 2.0 ^ nbits;

    for i = 1 : n0

      r = 0.5 * ( u - d );
      value = d + r;
      f = value * exp ( value ) - x;

      if ( f == 0.0 )
        return
      end

      if ( abs ( r ) <= tol )
        return
      end

      fd = d * exp ( d ) - x;

      if ( 0.0 < fd * f )
        d = value;
      else
        u = value;
      end

    end

  end
%
%  The iteration did not converge.
%
  ner = 1;

  return
end
