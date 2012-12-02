function w = hermite_genz_keister_lookup_weights_np ( n, np, p )

%*****************************************************************************80
%
%% HERMITE_GENZ_KEISTER_LOOKUP_WEIGHTS_NP: Genz-Keister Hermite weights.
%
%  Discussion:
%
%    The integral:
%
%      integral ( -oo <= x <= +oo ) f(x) exp ( - x * x ) dx
%
%    The quadrature rule:
%
%      sum ( 1 <= i <= n ) w(i) * f ( x(i) )
%
%    A nested family of rules for the Hermite integration problem
%    was produced by Genz and Keister.  The structure of the nested
%    family was denoted by 1+2+6+10+16, that is, it comprised rules 
%    of successive orders O = 1, 3, 9, 19, and 35.
%
%    The precisions of these rules are P = 1, 5, 15, 29, and 51.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Alan Genz, Bradley Keister,
%    Fully symmetric interpolatory rules for multiple integrals
%    over infinite regions with Gaussian weight,
%    Journal of Computational and Applied Mathematics,
%    Volume 71, 1996, pages 299-309
%
%    Florian Heiss, Viktor Winschel,
%    Likelihood approximation by numerical integration on sparse grids,
%    Journal of Econometrics,
%    Volume 144, 2008, pages 62-80.
%
%    Thomas Patterson,
%    The Optimal Addition of Points to Quadrature Formulae,
%    Mathematics of Computation,
%    Volume 22, Number 104, October 1968, pages 847-856.
%
%  Parameters:
%
%    Input, integer N, the order.
%    N must be 1, 3, 9, 19, or 35.
%
%    Input, integer NP, the number of parameters.
%
%    Input, real P(NP), the parameters.
%
%    Output, real W(N), the weights.
%
  w = hermite_genz_keister_lookup_weights ( n );

  return
end
