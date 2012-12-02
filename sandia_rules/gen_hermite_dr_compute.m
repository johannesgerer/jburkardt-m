function [ x, w ] = gen_hermite_dr_compute ( order, alpha )

%*****************************************************************************80
%
%% GEN_HERMITE_DR_COMPUTE computes a Generalized Hermite rule.
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
%    11 February 2010
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
%    Input, integer ORDER, the order of the rule.
%
%    Input, real ALPHA, the parameter.
%
%    Output, real X(ORDER), W(ORDER), the abscissas and weights.
%
  if ( order < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GEN_HERMITE_DR_COMPUTE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of ORDER = %d\n', order );
    error ( 'GEN_HERMITE_DR_COMPUTE - Fatal error!' );
  end

  x = zeros ( order, 1 );
  w = zeros ( order, 1 );

  if ( order == 1 )
    arg = ( alpha + 1.0 ) / 2.0;
    x(1) = 0.0;
    w(1) = gamma ( arg );
    return
  end
    
  if ( mod ( order, 2 ) == 0 )
    order_laguerre = floor ( order / 2 );
    alpha_laguerre = ( alpha - 1.0 ) / 2.0;
  elseif ( mod ( order, 2 ) == 1 )
    order_laguerre = floor ( order - 1 ) / 2;
    alpha_laguerre = ( alpha + 1.0 ) / 2.0;
  end
  
  [ x_laguerre, w_laguerre ] = gen_laguerre_ss_compute ( order_laguerre,  alpha_laguerre );
    
  if ( mod ( order, 2 ) == 0 )
 
    x(1:order_laguerre) = - sqrt ( x_laguerre(order_laguerre:-1:1) );
    x(order_laguerre+1:order_laguerre+order_laguerre) = sqrt ( x_laguerre(1:order_laguerre) );
	
    w(1:order_laguerre) = 0.5 * w_laguerre(order_laguerre:-1:1);
    w(order_laguerre+1:order_laguerre+order_laguerre) = 0.5 * w_laguerre(1:order_laguerre);
	
  elseif ( mod ( order, 2 ) == 1 )

    x(1:order_laguerre) = - sqrt ( x_laguerre(order_laguerre:-1:1) );
    x(order_laguerre+1) = 0.0;
    x(order_laguerre+2:order_laguerre+order_laguerre+1) = sqrt ( x_laguerre(1:order_laguerre) );

    w(1:order_laguerre) = 0.5 * w_laguerre(order_laguerre:-1:1) ...
                             ./ x_laguerre(order_laguerre:-1:1);

    arg = ( alpha + 1.0 ) / 2.0;
    w(order_laguerre+1) = gamma ( arg ) ...
      - sum ( w_laguerre(1:order_laguerre) ./ x_laguerre(1:order_laguerre) );

    w(order_laguerre+2:order_laguerre+order_laguerre+1) = 0.5 * w_laguerre(1:order_laguerre) ...
                                                             ./ x_laguerre(1:order_laguerre);

  end

  return
end
