function x = r8pp_sl ( n, r, b )

%*****************************************************************************80
%
%% R8PP_SL solves a R8PP system factored by R8PP_FA.
%
%  Discussion:
%
%    The R8PP storage format is appropriate for a symmetric positive
%    definite matrix.  Only the upper triangle of the matrix is stored,
%    by successive partial columns, in an array of length (N*(N+1))/2,
%    which contains (A11,A12,A22,A13,A23,A33,A14,...,ANN)  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2004
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Dongarra, Moler, Bunch and Stewart,
%    LINPACK User's Guide,
%    SIAM, (Society for Industrial and Applied Mathematics),
%    3600 University City Science Center,
%    Philadelphia, PA, 19104-2688.
%    ISBN 0-89871-172-X
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real R((N*(N+1))/2), the R factor output from R8PP_FA.
%
%    Input, real B(N), the right hand side.
%
%    Output, real X(N), the solution.
%
  x(1:n) = b(1:n);

  kk = 0;

  for k = 1 : n
    t = 0.0E+00;
    for i = 1 : k-1
      t = t + r(kk+i) * x(i);
    end
    kk = kk + k;
    x(k) = ( x(k) - t ) / r(kk);
  end

  for k = n : -1 : 1
    x(k) = x(k) / r(kk);
    kk = kk - k;
    t = -x(k);
    for i = 1 : k-1
      x(i) = x(i) + t * r(kk+i);
    end
  end

  return
end
