function [ r, info ] = r8pp_fa ( n, a )

%*****************************************************************************80
%
%% R8PP_FA factors a R8PP matrix.
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
%    MATLAB version by John Burkardt
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
%    Input, real A((N*(N+1))/2), a R8PP matrix.
%
%    Output, real R((N*(N+1))/2), an upper triangular matrix R, stored 
%    in packed form, so that A = R'*R.
%
%    Output, integer INFO, error flag.
%    0, for normal return.
%    K, if the leading minor of order K is not positive definite.
%
  info = 0;

  r(1:(n*(n+1))/2) = a(1:(n*(n+1))/2);

  jj = 0;

  for j = 1 : n

    s = 0.0E+00;
    kj = jj;
    kk = 0;

    for k = 1 : j-1

      kj = kj + 1;
      t = r(kj);
      for i = 1 : k-1
        t = t - r(kk+i) * r(jj+i);
      end
      kk = kk + k;
      t = t / r(kk);
      r(kj) = t;
      s = s + t * t;

    end

    jj = jj + j;
    s = r(jj) - s;

    if ( s <= 0.0E+00 )
      info = j;
      return;
    end

    r(jj) = sqrt ( s );

  end

  return
end
