function [ x, w ] = gen_hermite_dr_compute ( n, alpha )

%*****************************************************************************80
%
%% GEN_HERMITE_DR_COMPUTE computes a generalized Gauss-Hermite rule.
%
%  Discussion:
%
%    The integral to be approximated has the form:
%
%      Integral ( -oo < x < +oo ) |x|^ALPHA exp(-x^2) f(x) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Dover, 2007,
%    ISBN: 0486453391,
%    LC: QA299.3.D28.
%
%  Parameters:
%
%    Input, integer N, the order.
%
%    Input, real ALPHA, the parameter.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%
  x = zeros ( n, 1 );
  w = zeros ( n, 1 );

  if ( n == 1 )
    arg = ( alpha + 1.0 ) / 2.0;
    x(1) = 0.0;
    w(1) = gamma ( arg );
    return
  end
    
  if ( mod ( n, 2 ) == 0 )
    n_laguerre = floor ( n / 2 );
    alpha_laguerre = ( alpha - 1.0 ) / 2.0;
  elseif ( mod ( n, 2 ) == 1 )
    n_laguerre = floor ( n - 1 ) / 2;
    alpha_laguerre = ( alpha + 1.0 ) / 2.0;
  end
  
  [ x_laguerre, w_laguerre ] = gen_laguerre_ss_compute ( n_laguerre,  alpha_laguerre );
    
  if ( mod ( n, 2 ) == 0 )
 
    x(1:n_laguerre) = - sqrt ( x_laguerre(n_laguerre:-1:1) );
    x(n_laguerre+1:n_laguerre+n_laguerre) = sqrt ( x_laguerre(1:n_laguerre) );
	
    w(1:n_laguerre) = 0.5 * w_laguerre(n_laguerre:-1:1);
    w(n_laguerre+1:n_laguerre+n_laguerre) = 0.5 * w_laguerre(1:n_laguerre);
	
  elseif ( mod ( n, 2 ) == 1 )

    x(1:n_laguerre) = - sqrt ( x_laguerre(n_laguerre:-1:1) );
    x(n_laguerre+1) = 0.0;
    x(n_laguerre+2:n_laguerre+n_laguerre+1) = sqrt ( x_laguerre(1:n_laguerre) );

    w(1:n_laguerre) = 0.5 * w_laguerre(n_laguerre:-1:1) ...
                             ./ x_laguerre(n_laguerre:-1:1);

    arg = ( alpha + 1.0 ) / 2.0;
    w(n_laguerre+1) = gamma ( arg ) ...
      - sum ( w_laguerre(1:n_laguerre) ./ x_laguerre(1:n_laguerre) );

    w(n_laguerre+2:n_laguerre+n_laguerre+1) = 0.5 * w_laguerre(1:n_laguerre) ...
                                                             ./ x_laguerre(1:n_laguerre);

  end

  return
end
