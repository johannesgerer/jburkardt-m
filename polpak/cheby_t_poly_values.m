function [ n_data, n, x, fx ] = cheby_t_poly_values ( n_data )

%*****************************************************************************80
%
%% CHEBY_T_POLY_VALUES returns values of Chebyshev polynomials T(n,x).
%
%  Discussion:
%
%    In Mathematica, the function can be evaluated by:
%
%      ChebyshevT[n,x]
%
%    Chebyshev polynomials are useful as a basis for representing the
%    approximation of functions since they are well conditioned, in the sense
%    that in the interval [-1,1] they each have maximum absolute value 1.
%    Hence an error in the value of a coefficient of the approximation, of
%    size epsilon, is exactly reflected in an error of size epsilon between
%    the computed approximation and the theoretical approximation.
%
%    Typical usage is as follows, where we assume for the moment
%    that the interval of approximation is [-1,1].  The value
%    of N is chosen, the highest polynomial to be used in the
%    approximation.  Then the function to be approximated is
%    evaluated at the N+1 points XJ which are the zeroes of the N+1-th
%    Chebyshev polynomial.  Let these values be denoted by F(XJ).
%
%    The coefficients of the approximation are now defined by
%
%      C(I) = 2/(N+1) * sum ( 1 <= J <= N+1 ) F(XJ) T(I)(XJ)
%
%    except that C(0) is given a value which is half that assigned
%    to it by the above formula,
%
%    and the representation is
%
%    F(X) approximated by sum ( 0 <= J <= N ) C(J) T(J)(X)
%
%    Now note that, again because of the fact that the Chebyshev polynomials
%    have maximum absolute value 1, if the higher order terms of the
%    coefficients C are small, then we have the option of truncating
%    the approximation by dropping these terms, and we will have an
%    exact value for maximum perturbation to the approximation that
%    this will cause.
%
%    It should be noted that typically the error in approximation
%    is dominated by the first neglected basis function (some multiple of
%    T(N+1)(X) in the example above).  If this term were the exact error,
%    then we would have found the minimax polynomial, the approximating
%    polynomial of smallest maximum deviation from the original function.
%    The minimax polynomial is hard to compute, and another important
%    feature of the Chebyshev approximation is that it tends to behave
%    like the minimax polynomial while being easy to compute.
%
%    To evaluate a sum like 
%
%      sum ( 0 <= J <= N ) C(J) T(J)(X), 
%
%    Clenshaw's recurrence formula is recommended instead of computing the
%    polynomial values, forming the products and summing.
%
%    Assuming that the coefficients C(J) have been computed
%    for J = 0 to N, then the coefficients of the representation of the
%    indefinite integral of the function may be computed by
%
%      B(I) = ( C(I-1) - C(I+1))/2*(I-1) for I=1 to N+1, 
%
%    with
% 
%      C(N+1)=0
%      B(0) arbitrary.  
%
%    Also, the coefficients of the representation of the derivative of the 
%    function may be computed by:
%
%      D(I) = D(I+2)+2*I*C(I) for I=N-1, N-2, ..., 0, 
%
%    with
%
%      D(N+1) = D(N) = 0.
%
%    Some of the above may have to adjusted because of the irregularity of C(0).
%
%  Differential equation:
%
%    (1-X*X) * Y'' - X * Y' + N * N * Y = 0
%
%  Formula:
%
%    T(N)(X) = cos ( N * arccos(X) )
%
%  First terms:
%
%    T(0)(X) =  1
%    T(1)(X) =  1 X
%    T(2)(X) =  2 X**2 -   1
%    T(3)(X) =  4 X**3 -   3 X
%    T(4)(X) =  8 X**4 -   8 X**2 +  1
%    T(5)(X) = 16 X**5 -  20 X**3 +  5 X
%    T(6)(X) = 32 X**6 -  48 X**4 + 18 X**2 - 1
%    T(7)(X) = 64 X**7 - 112 X**5 + 56 X**3 - 7 X
%
%  Inequality:
%
%    abs ( T(N)(X) ) <= 1 for -1 <= X <= 1
%
%  Orthogonality:
%
%    For integration over [-1,1] with weight
%
%      W(X) = 1 / sqrt(1-X*X), 
%
%    if we write the inner product of T(I)(X) and T(J)(X) as
%
%      < T(I)(X), T(J)(X) > = integral ( -1 <= X <= 1 ) W(X) T(I)(X) T(J)(X) dX
%
%    then the result is:
%
%      0 if I /= J
%      PI/2 if I == J /= 0
%      PI if I == J == 0
%
%    A discrete orthogonality relation is also satisfied at each of
%    the N zeroes of T(N)(X):  sum ( 1 <= K <= N ) T(I)(X) * T(J)(X)
%                              = 0 if I /= J
%                              = N/2 if I == J /= 0
%                              = N if I == J == 0
%
%  Recursion:
%
%    T(0)(X) = 1,
%    T(1)(X) = X,
%    T(N)(X) = 2 * X * T(N-1)(X) - T(N-2)(X)
%
%    T'(N)(X) = N * ( -X * T(N)(X) + T(N-1)(X) ) / ( 1 - X**2 )
%
%  Special values:
%
%    T(N)(1) = 1
%    T(N)(-1) = (-1)**N
%    T(2N)(0) = (-1)**N
%    T(2N+1)(0) = 0
%    T(N)(X) = (-1)**N * T(N)(-X)
%
%  Zeroes:
%
%    M-th zero of T(N)(X) is cos((2*M-1)*PI/(2*N)), M = 1 to N
%
%  Extrema:
%
%    M-th extremum of T(N)(X) is cos(PI*M/N), M = 0 to N
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz and Irene Stegun,
%    Handbook of Mathematical Functions,
%    US Department of Commerce, 1964.
%
%    Stephen Wolfram,
%    The Mathematica Book,
%    Fourth Edition,
%    Wolfram Media / Cambridge University Press, 1999.
%
%  Parameters:
%
%    Input/output, integer N_DATA.  The user sets N_DATA to 0 before the
%    first call.  On each call, the routine increments N_DATA by 1, and
%    returns the corresponding data; when there is no more data, the
%    output value of N_DATA will be 0 again.
%
%    Output, integer N, the order of the function.
%
%    Output, real X, the point where the function is evaluated.
%
%    Output, real FX, the value of the function.
%
  n_max = 13;

  fx_vec = [ ...
      0.1000000000000000E+01, ... 
      0.8000000000000000E+00, ... 
      0.2800000000000000E+00, ... 
     -0.3520000000000000E+00, ... 
     -0.8432000000000000E+00, ... 
     -0.9971200000000000E+00, ... 
     -0.7521920000000000E+00, ... 
     -0.2063872000000000E+00, ... 
      0.4219724800000000E+00, ... 
      0.8815431680000000E+00, ... 
      0.9884965888000000E+00, ... 
      0.7000513740800000E+00, ... 
      0.1315856097280000E+00 ];

  n_vec = [ ...
     0,  1,  2, ...
     3,  4,  5, ...
     6,  7,  8, ...
     9, 10, 11, ...
    12 ];

  x_vec = [ ...
     0.8E+00, ... 
     0.8E+00, ...
     0.8E+00, ...
     0.8E+00, ...
     0.8E+00, ...
     0.8E+00, ...
     0.8E+00, ...
     0.8E+00, ...
     0.8E+00, ...
     0.8E+00, ...
     0.8E+00, ...
     0.8E+00, ...
     0.8E+00 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    n = 0;
    x = 0.0;
    fx = 0.0;
  else
    n = n_vec(n_data);
    x = x_vec(n_data);
    fx = fx_vec(n_data);
  end

  return
end
