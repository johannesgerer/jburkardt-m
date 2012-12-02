function value = tfn ( h, a )

%*****************************************************************************80
%
%% TFN calculates the T function of Owen.
%
%  Discussion:
%
%    Owen's T function is useful for computation of the bivariate normal
%    distribution and the distribution of a skewed normal distribution.
%
%    Although it was originally formulated in terms of the bivariate
%    normal function, the function can be defined more directly as
%
%      T(H,A) = 1 / ( 2 * pi ) * 
%        Integral ( 0 <= X <= A ) e^( -H^2 * (1+X^2) / 2) / (1+X^2) dX
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 August 2006
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    D B Owen,
%    Tables for computing the bivariate normal distribution,
%    Annals of Mathematical Statistics,
%    Volume 27, pages 1075-1090, 1956.
%
%    J C Young and C E Minder,
%    Algorithm AS 76,
%    An Algorithm Useful in Calculating Non-Central T and 
%    Bivariate Normal Distributions,
%    Applied Statistics,
%    Volume 23, Number 3, 1974, pages 455-457.
%
%  Parameters:
%
%    Input, real H, A, the arguments of the T function.
%
%    Output, real VALUE, the value of the T function.
%
  ngauss = 10;

  two_pi_inverse = 0.1591549430918953;
  tv1 = 1.0E-35;
  tv2 = 15.0;
  tv3 = 15.0;
  tv4 = 1.0E-05;
  weight = [ ...
    0.666713443086881375935688098933E-01, ...
    0.149451349150580593145776339658E+00, ...
    0.219086362515982043995534934228E+00, ...
    0.269266719309996355091226921569E+00, ...
    0.295524224714752870173892994651E+00, ...
    0.295524224714752870173892994651E+00, ...
    0.269266719309996355091226921569E+00, ...
    0.219086362515982043995534934228E+00, ...
    0.149451349150580593145776339658E+00, ...
    0.666713443086881375935688098933E-01];
  xtab = [
   -0.973906528517171720077964012084E+00, ...
   -0.865063366688984510732096688423E+00, ...
   -0.679409568299024406234327365115E+00, ...
   -0.433395394129247190799265943166E+00, ...
   -0.148874338981631210884826001130E+00, ...
    0.148874338981631210884826001130E+00, ...
    0.433395394129247190799265943166E+00, ...
    0.679409568299024406234327365115E+00, ...
    0.865063366688984510732096688423E+00, ...
    0.973906528517171720077964012084E+00 ];
%
%  Test for H near zero.
%
  if ( abs ( h ) < tv1 )
    value = atan ( a ) * two_pi_inverse;
%
%  Test for large values of abs(H).
%
  elseif ( tv2 < abs ( h ) )
    value = 0.0;
%
%  Test for A near zero.
%
  elseif ( abs ( a ) < tv1 )
    value = 0.0;
%
%  Test whether abs(A) is so large that it must be truncated.
%  If so, the truncated value of A is H2.
%
  else

    hs = - 0.5 * h * h;
    h2 = a;
    as = a * a;
%
%  Computation of truncation point by Newton iteration.
%
    if ( tv3 <= log ( 1.0 + as ) - hs * as )

      h1 = 0.5 * a;
      as = 0.25 * as;

      while ( 1 )

        rt = as + 1.0;
        h2 = h1 + ( hs * as + tv3 - log ( rt ) ) ...
          / ( 2.0 * h1 * ( 1.0 / rt - hs ) );
        as = h2 * h2;

        if ( abs ( h2 - h1 ) < tv4 )
          break
        end

        h1 = h2;

      end

    end
%
%  Gaussian quadrature on the interval [0,H2].
%
    rt = 0.0;
    for i = 1 : ngauss
      x = 0.5 * h2 * ( xtab(i) + 1.0 );
      rt = rt + weight(i) * exp ( hs * ( 1.0 + x * x ) ) / ( 1.0 + x * x );
    end

    value = rt * ( 0.5 * h2 ) * two_pi_inverse;

  end 

  return
end
