function [ div, vort ] = div_q4 ( m, n, u, v, q )

%*****************************************************************************80
%
%% DIV_Q4 estimates the divergence and vorticity of a discrete field.
%
%  Discussion:
%
%    The routine is given the values of a vector field ( U(X,Y), V(X,Y) ) at
%    an array of points ( X(1:M), Y(1:N) ).
%
%    The routine models the vector field over the interior of this region using
%    a bilinear interpolant.  It then uses the interpolant to estimate the
%    value of the divergence:
%
%      DIV(X,Y) = dU/dX + dV/dY
%
%    and the vorticity:
%
%      VORT(X,Y) = dV/dX - dU/dY
%
%    at the center point of each of the bilinear elements.
%
%        |       |       |
%      (3,1)---(3,2)---(3,3)---
%        |       |       |
%        | [2,1] | [2,2] |
%        |       |       |
%      (2,1)---(2,2)---(2,3)---
%        |       |       |
%        | [1,1] | [1,2] |
%        |       |       |
%      (1,1)---(1,2)---(1,3)---
%
%    Here, the nodes labeled with parentheses represent the points at
%    which the original (U,V) data is given, while the nodes labeled
%    with square brackets represent the centers of the bilinear
%    elements, where the approximations to the divergence and vorticity
%    are made.
%
%    The reason for evaluating the divergence and vorticity in this way
%    is that the bilinear interpolant to the (U,V) data is not
%    differentiable at the boundaries of the elements, nor especially at
%    the nodes, but is an (infinitely differentiable) bilinear function
%    in the interior of each element.  If a value at the original nodes
%    is strongly desired, then the average at the four surrounding
%    central nodes may be taken.
%
%  Reference Element Q4:
%
%    |
%    1  4-----3
%    |  |     |
%    |  |     |
%    S  |     |
%    |  |     |
%    |  |     |
%    0  1-----2
%    |
%    +--0--R--1-->
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of data rows.  M must be at least 2.
%
%    Input, integer N, the number of data columns.  N must be at least 2.
%
%    Input, real U(M,N), V(M,N), the value of the components
%    of a vector quantity whose divergence and vorticity are desired.
%    A common example would be that U and V are the horizontal and
%    vertical velocity component of a flow field.
%
%    Input, real Q(2,4), the coordinates of the four nodes of the
%    quadrilateral, given in counterclockwise order.
%
%    Output, real DIV(M-1,N-1), an estimate for
%    the divergence in the bilinear element that lies between
%    data rows I and I+1, and data columns J and J+1.
%
%    Output, real VORT(M-1,N-1), an estimate for
%    the vorticity in the bilinear element that lies between
%    data rows I and I+1, and data columns J and J+1.
%
  if ( m <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIV_Q4 - Fatal error!\n' );
    fprintf ( 1, '  M must be at least 2,\n' );
    fprintf ( 1, '  but the input value of M is %d\n', m );
    error ( 'DIV_Q4 - Fatal error!' );
  end

  if ( n <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DIV_Q4 - Fatal error!\n' );
    fprintf ( 1, '  N must be at least 2,\n' );
    fprintf ( 1, '  but the input value of N is %d\n', n );
    error ( 'DIV_Q4 - Fatal error!' );
  end

  for i = 1 : m-1

    q2(2,1) =   ( ( 2 * m - 2 * i     ) * q(2,1)   ...
                + (         2 * i - 2 ) * q(2,3) ) ...
                / ( 2 * m         - 2 );
    p(2,1) =    ( ( 2 * m - 2 * i - 1 ) * q(2,1)   ...
                + (         2 * i - 1 ) * q(2,3) ) ...
                / ( 2 * m         - 2 );
    q2(2,3) =   ( ( 2 * m - 2 * i - 2 ) * q(2,1)   ...
                + (         2 * i     ) * q(2,3) ) ...
                / ( 2 * m         - 2 );

    q2(2,2) = q2(2,1);
    q2(2,4) = q2(2,3);

    for j = 1 : n-1

      q2(1,1) =   ( ( 2 * n - 2 * j     ) * q(1,1)   ...
                  + (         2 * j - 2 ) * q(1,3) ) ...
                  / ( 2 * n         - 2 );
      p(1,1) =    ( ( 2 * n - 2 * j - 1 ) * q(1,1)   ...
                  + (         2 * j - 1 ) * q(1,3) ) ...
                  / ( 2 * n         - 2 );
      q2(1,3) =   ( ( 2 * n - 2 * j - 2 ) * q(1,1)   ...
                  + (         2 * j     ) * q(1,3) ) ...
                  / ( 2 * n         - 2 );

      q2(1,2) = q2(1,3);
      q2(1,4) = q2(1,1);

      [ phi, dphidx, dphidy ] =  basis_mn_q4 ( q2, 1, p );
%
%  Note the following formula for the value of U and V at the same
%  point that the divergence and vorticity are being evaluated.
%
%         umid =  u(i  ,j  ) * phi(1) ...
%               + u(i  ,j+1) * phi(2) ...
%               + u(i+1,j+1) * phi(3) ...
%               + u(i+1,j  ) * phi(4);
%
%         vmid =  v(i  ,j  ) * phi(1) ...
%               + v(i  ,j+1) * phi(2) ...
%               + v(i+1,j+1) * phi(3) ...
%               + v(i+1,j  ) * phi(4);
%
      div(i,j) =  u(i  ,j  ) * dphidx(1) + v(i  ,j  ) * dphidy(1) ...
                + u(i  ,j+1) * dphidx(2) + v(i  ,j+1) * dphidy(2) ...
                + u(i+1,j+1) * dphidx(3) + v(i+1,j+1) * dphidy(3) ...
                + u(i+1,j  ) * dphidx(4) + v(i+1,j  ) * dphidy(4);

      vort(i,j) =  v(i  ,j  ) * dphidx(1) - u(i  ,j  ) * dphidy(1) ...
                 + v(i  ,j+1) * dphidx(2) - u(i  ,j+1) * dphidy(2) ...
                 + v(i+1,j+1) * dphidx(3) - u(i+1,j+1) * dphidy(3) ...
                 + v(i+1,j  ) * dphidx(4) - u(i+1,j  ) * dphidy(4);

    end
  end

  return
end
