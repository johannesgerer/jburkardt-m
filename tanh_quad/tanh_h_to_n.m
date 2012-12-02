function n = tanh_h_to_n ( h, tol )

%*****************************************************************************80
%
%% TANH_H_TO_N computes N as a function of H and TOL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real H, the spacing.
%
%    Input, real TOL, the tolerance.
%
%    Output, integer N, the corresponding quadrature order.
%
  n = 0;

  while ( 1 )

    t = n * h / 2.0;

    ct = cosh ( t );

    w = 0.5 * h / ct / ct;

    if ( w <= tol )
      break
    end

    n = n + 1;

  end

  return
end
