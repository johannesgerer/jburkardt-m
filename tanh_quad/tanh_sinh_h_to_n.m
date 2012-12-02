function n = tanh_sinh_h_to_n ( h, tol )

%*****************************************************************************80
%
%% TANH_SINH_H_TO_N computes N as a function of H and TOL for the tanh-sinh rule.
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

    t = n * h;

    ct = cosh ( t );
    st = sinh ( t );
    ct2 = cosh ( 0.5 * pi * st );

    w = 0.5 * pi * h * ct / ct2 / ct2;

    if ( w <= tol )
      break
    end

    n = n + 1;

  end

  return
end
