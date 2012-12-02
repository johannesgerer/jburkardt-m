function value = r8_acosh ( x )

%*****************************************************************************80
%
%% R8_ACOSH returns the inverse hyperbolic cosine of a number.
%
%  Discussion:
%
%    Applying the inverse function
%
%      Y = R8_ACOSH(X)
%
%    implies that
%
%      X = COSH(Y) = 0.5 * ( EXP(Y) + EXP(-Y) ).
%
%    For every X greater than or equal to 1, there are two possible
%    choices Y such that X = COSH(Y), differing only in sign.  It
%    is usual to resolve this choice by taking the value of R8_ACOSH(X)
%    to be nonnegative.
%
%    One formula is:
%
%      R8_ACOSH = LOG ( X + SQRT ( X**2 - 1.0 ) )
%
%    but this formula suffers from roundoff and overflow problems.
%    The formula used here was recommended by W Kahan, as discussed
%    by Moler.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 February 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Cleve Moler,
%    Trigonometry is a Complex Subject,
%    MATLAB News and Notes,
%    Summer 1998.
%
%  Parameters:
%
%    Input, real X, the number whose inverse hyperbolic cosine is desired.
%    X should be greater than or equal to 1.
%
%    Output, real VALUE, the inverse hyperbolic cosine of X.  The
%    principal value (that is, the positive value of the two ) is returned.
%
  if ( x < 1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_ACOSH - Fatal error!\n' );
    fprintf ( 1, '  Argument X must satisfy 1 <= X.\n' );
    fprintf ( 1, '  The input X = %f\n', x );
    error ( 'R8_ACOSH - Fatal error!' );
  end

  value = 2.0 * log ( sqrt ( 0.5 * ( x + 1.0 ) ) ...
                    + sqrt ( 0.5 * ( x - 1.0 ) ) );

  return
end
