function value = beta_inc ( a, b, x )

%*****************************************************************************80
%
%% BETA_INC returns the value of the incomplete Beta function.
%
%  Discussion:
%
%    This calculation requires an iteration.  In some cases, the iteration
%    may not converge rapidly, or may become inaccurate.
%
%    BETA_INC(A,B,X)
%
%      =   Integral ( 0 <= T <= X ) T**(A-1) (1-T)**(B-1) dT
%        / Integral ( 0 <= T <= 1 ) T**(A-1) (1-T)**(B-1) dT
%
%      =   Integral ( 0 <= T <= X ) T**(A-1) (1-T)**(B-1) dT
%        / BETA(A,B)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2004
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Majumder and Bhattacharjee,
%    Algorithm AS63,
%    Applied Statistics,
%    1973, volume 22, number 3.
%
%  Parameters:
%
%    Input, A, B, the parameters of the function.
%    0.0D+00 < A,
%    0.0D+00 < B.
%
%    Input, real X, the argument of the function.
%    Normally, 0.0D+00 <= X <= 1.0.
%
%    Output, BETA_INC, the value of the function.
%
  it_max = 1000;
  tol = 1.0E-07;

  if ( a <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BETA_INC - Fatal error!\n' );
    fprintf ( 1, '  A <= 0.\n' );
    error ( 'BETA_INC - Fatal error!' );
  end

  if ( b <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BETA_INC - Fatal error!\n' );
    fprintf ( 1, '  B <= 0.\n' );
    error ( 'BETA_INC - Fatal error!' );
  end

  if ( x <= 0.0 )
    value = 0.0;
    return
  elseif ( 1.0 <= x )
    value = 1.0;
    return
  end
%
%  Change tail if necessary and determine S.
%
  psq = a + b;

  if ( a < ( a + b ) * x )
    xx = 1.0 - x;
    cx = x;
    pp = b;
    qq = a;
    indx = 1;
  else
    xx = x;
    cx = 1.0 - x;
    pp = a;
    qq = b;
    indx = 0;
  end

  term = 1.0;
  i = 1;
  value = 1.0;

  ns = floor ( qq + cx * ( a + b ) );
%
%  Use Soper's reduction formulas.
%
  rx = xx / cx;

  temp = qq - i;
  if ( ns == 0 )
    rx = xx;
  end

  it = 0;

  while ( 1 )

    it = it + 1;

    if ( it_max < it )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'BETA_INC - Fatal error!\n' );
      fprintf ( 1, '  Maximum number of iterations exceeded!\n' );
      fprintf ( 1, '  IT_MAX = %d\n', it_max );
      error ( 'BETA_INC - Fatal error!' );
    end

    term = term * temp * rx / ( pp + i );
    value = value + term;
    temp = abs ( term );

    if ( temp <= tol & temp <= tol * value )
      break
    end

    i = i + 1;
    ns = ns - 1;

    if ( 0 <= ns )
      temp = qq - i;
      if ( ns == 0 )
        rx = xx;
      end
    else
      temp = psq;
      psq = psq + 1.0;
    end

  end
%
%  Finish calculation.
%
  value = value * exp ( pp * log ( xx )  + ( qq - 1.0 ) * log ( cx ) ) ...
    / ( beta ( a, b ) * pp );

  if ( indx )
    value = 1.0 - value;
  end

  return
end
