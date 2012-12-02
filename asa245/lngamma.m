function [ value, ier ] = lngamma ( z )

%*****************************************************************************80
%
%% LNGAMMA computes Log(Gamma(X)) using a Lanczos approximation.
%
%  Discussion:
%
%    This algorithm is not part of the Applied Statistics algorithms.
%    It is slower but gives 14 or more significant decimal digits
%    accuracy, except around X = 1 and X = 2.   The Lanczos series from
%    which this algorithm is derived is interesting in that it is a
%    convergent series approximation for the gamma function, whereas
%    the familiar series due to De Moivre (and usually wrongly called
%    the Stirling approximation) is only an asymptotic approximation, as
%    is the true and preferable approximation due to Stirling.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2008
%
%  Author:
%
%    Original FORTRAN77 version by Alan Miller.
%    MATLAB  version by John Burkardt.
%
%  Reference:
%
%    Cornelius Lanczos,
%    A precision approximation of the gamma function,
%    SIAM Journal on Numerical Analysis, B,
%    Volume 1, 1964, pages 86-96.
%
%  Parameters:
%
%    Input, real Z, the argument of the Gamma function.
%
%    Output, real ALUE, the logarithm of the gamma function of Z.
%
%    Output, integer IER, error flag.
%    0, no error occurred.
%    1, Z is less than or equal to 0.
%
  a = [ ...
         0.9999999999995183, ...
       676.5203681218835, ...
    - 1259.139216722289, ...
       771.3234287757674, ...
     - 176.6150291498386, ...
        12.50734324009056, ...
       - 0.1385710331296526, ...
         0.9934937113930748E-05, ...
         0.1659470187408462E-06 ];
  lnsqrt2pi = 0.9189385332046727;

  if ( z <= 0.0 )
    ier = 1;
    value = 0.0;
    return
  end

  ier = 0;

  value = 0.0;
  tmp = z + 7.0;

  for j = 9 : -1 : 2
    value = value + a(j) / tmp;
    tmp = tmp - 1.0;
  end

  value = value + a(1);
  value = log ( value ) + lnsqrt2pi - ( z + 6.5 ) + ...
    ( z - 0.5 ) * log ( z + 6.5 );

  return
end
