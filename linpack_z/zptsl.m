function b = zptsl ( n, d, e, b )

%*****************************************************************************80
%
%% ZPTSL solves a Hermitian positive definite tridiagonal linear system.
%
%  Discussion;
%
%    The system does not have to be factored first.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 May 2007
%
%  Author:
%
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Jack Dongarra, Jim Bunch, Cleve Moler, Pete Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979,
%    ISBN13: 978-0-898711-72-1,
%    LC: QA214.L56.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, complex D(N), the diagonal of the matrix.
%
%    Input, complex E(N), the superdiagonal of the matrix in E(1:N-1).
%
%    Input, complex B(N), the right hand side.
%
%    Output, complex B(N), the solution.
%

%
%  Check for 1 x 1 case.
%
  if ( n == 1 )
    b(1) = b(1) / d(1);
    return
  end

  nm1 = n - 1;
  nm1d2 = floor ( ( n - 1 ) / 2 );

  if ( n ~= 2 )

    kbm1 = n - 1;
%
%  Zero top half of subdiagonal and bottom half of superdiagonal.
%
    for k = 1 : nm1d2
      t1 = conj ( e(k) ) / d(k);
      d(k+1) = d(k+1) - t1 * e(k);
      b(k+1) = b(k+1) - t1 * b(k);
      t2 = e(kbm1) / d(kbm1+1);
      d(kbm1) = d(kbm1) - t2 * conj ( e(kbm1) );
      b(kbm1) = b(kbm1) - t2 * b(kbm1+1);
      kbm1 = kbm1 - 1;
    end

  end

  kp1 = nm1d2 + 1;
%
%  Clean up for possible 2 x 2 block at center.
%
  if ( mod ( n, 2 ) == 0 )
    t1 = conj ( e(kp1) ) / d(kp1);
    d(kp1+1) = d(kp1+1) - t1 * e(kp1);
    b(kp1+1) = b(kp1+1) - t1 * b(kp1);
    kp1 = kp1 + 1;
  end
%
%  Back solve starting at the center, going towards the top and bottom.
%
  b(kp1) = b(kp1) / d(kp1);

  if ( n ~= 2 )

    k = kp1 - 1;
    ke = kp1 + nm1d2 - 1;

    for kf = kp1 : ke
      b(k) = ( b(k) - e(k) * b(k+1) ) / d(k);
      b(kf+1) = ( b(kf+1) - conj ( e(kf) ) * b(kf) ) / d(kf+1);
      k = k - 1;
    end

  end

  if ( mod ( n, 2 ) == 0 )
    b(1) = ( b(1) - e(1) * b(2) ) / d(1);
  end

  return
end
