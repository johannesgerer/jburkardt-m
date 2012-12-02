function cond = condition_sample1 ( n, a, m )

%*****************************************************************************80
%
%% CONDITION_SAMPLE1 estimates the L1 condition number of a matrix.
%
%  Discussion:
%
%    A naive sampling method is used.
%
%    Only "forward" sampling is used, that is, we only look at results
%    of the form y=A*x.
%
%    Presumably, solving systems A*y=x would give us a better idea of
%    the inverse matrix.
%
%    Moreover, a power sequence y1 = A*x, y2 = A*y1, ... and the same for
%    the inverse might work better too.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the matrix.
%
%    Input, real A(N,N), the matrix.
%
%    Input, integer M, the number of samples to use.
%
%    Output, real COND, an estimate of the L1 condition number.
%
  a_norm = 0.0;
  ainv_norm = 0.0;
  seed = 123456789;

  for i = 1 : m

    [ x, seed ] = r8vec_uniform_unit ( n, seed );
    x_norm = norm ( x, 1 );
    ax = a * x;
    ax_norm = norm ( ax, 1 );

    if ( ax_norm == 0.0 )
      cond = 0.0;
      return
    end

    a_norm    = max ( a_norm,    ax_norm / x_norm  );
    ainv_norm = max ( ainv_norm, x_norm  / ax_norm );

  end

  cond = a_norm * ainv_norm;

  return
end
